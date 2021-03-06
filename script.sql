USE [Blog_Assignment]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/7/2021 11:40:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[aid] [int] NOT NULL,
 CONSTRAINT [PK_Account_1] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 11/7/2021 11:40:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[bid] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[blogTitle] [nvarchar](max) NOT NULL,
	[bfrom] [date] NOT NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK__Blog__DE90ADE7C68504B0] PRIMARY KEY CLUSTERED 
(
	[bid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 11/7/2021 11:40:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[blgid] [int] NOT NULL,
	[usid] [int] NOT NULL,
	[cdes] [nvarchar](max) NULL,
	[cfrom] [datetime] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feature]    Script Date: 11/7/2021 11:40:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Feature](
	[fid] [int] NOT NULL,
	[url] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Group]    Script Date: 11/7/2021 11:40:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Group](
	[gid] [int] NOT NULL,
	[gname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Group Account]    Script Date: 11/7/2021 11:40:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Group Account](
	[gaid] [int] NOT NULL,
	[gausername] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Group Account] PRIMARY KEY CLUSTERED 
(
	[gaid] ASC,
	[gausername] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Group Feature]    Script Date: 11/7/2021 11:40:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group Feature](
	[gfid] [int] NOT NULL,
	[fgid] [int] NOT NULL,
 CONSTRAINT [PK_Group Feature] PRIMARY KEY CLUSTERED 
(
	[gfid] ASC,
	[fgid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 11/7/2021 11:40:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[displayname] [nvarchar](150) NOT NULL,
	[gender] [bit] NOT NULL,
	[dob] [date] NOT NULL,
	[address] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__User__DD701264AE277B09] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([username], [password], [aid]) VALUES (N'123@123', N'123@123', 6)
INSERT [dbo].[Account] ([username], [password], [aid]) VALUES (N'HuyenTrTT', N'qwe123', 2)
INSERT [dbo].[Account] ([username], [password], [aid]) VALUES (N'huynk', N'qweqwe', 5)
INSERT [dbo].[Account] ([username], [password], [aid]) VALUES (N'loandp', N'123123', 4)
INSERT [dbo].[Account] ([username], [password], [aid]) VALUES (N'nanlt', N'123', 3)
INSERT [dbo].[Account] ([username], [password], [aid]) VALUES (N'tiennq', N'123qwe', 1)
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([bid], [userid], [blogTitle], [bfrom], [description]) VALUES (1, 1, N'Our new issue was procured by contributing editor Will Allison, so I''m passing the mic over to him to make the introductions. Take it away, Will! - PR', CAST(N'2021-11-07' AS Date), N'To reveal any more would be to spoil the surprise (and other surprises to come), so I won''t. But suffice it to say, it''s a delightfully satisfying plot, rendered in confident, precise writing that no doubt benefits from Aspell''s background as a poet. The net result is an entertaining, quietly funny, and deeply thoughtful exploration of what it means to borrow from another person''s work.')
INSERT [dbo].[Blog] ([bid], [userid], [blogTitle], [bfrom], [description]) VALUES (2, 1, N'This is a blog', CAST(N'2021-11-07' AS Date), N'This is a new blog This is a new blog This is a new blog This is a new blog This is a new blog This is a new blog This is a new blog. This is a new blog
')
INSERT [dbo].[Blog] ([bid], [userid], [blogTitle], [bfrom], [description]) VALUES (3, 1, N'New blog 123', CAST(N'2021-11-07' AS Date), N'new blog 123 @@## __ ')
INSERT [dbo].[Blog] ([bid], [userid], [blogTitle], [bfrom], [description]) VALUES (4, 1, N'new !! @@ ##', CAST(N'2021-11-07' AS Date), N'$$%%^^&&**(())__++==--[][][]{}{}{}/*-+
')
INSERT [dbo].[Blog] ([bid], [userid], [blogTitle], [bfrom], [description]) VALUES (5, 2, N'my title', CAST(N'2021-11-07' AS Date), N'my test 123 123 my test 123 123 my test 123 123 my test 123 123')
INSERT [dbo].[Blog] ([bid], [userid], [blogTitle], [bfrom], [description]) VALUES (6, 2, N'nonononon', CAST(N'2021-11-07' AS Date), N'nonononononon')
INSERT [dbo].[Blog] ([bid], [userid], [blogTitle], [bfrom], [description]) VALUES (7, 6, N'123123', CAST(N'2021-11-07' AS Date), N'123123123123123123123123123123123123123123123123123123123123123123123123123123123123')
SET IDENTITY_INSERT [dbo].[Blog] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([cid], [blgid], [usid], [cdes], [cfrom]) VALUES (1, 1, 1, N'great', CAST(N'2021-11-07 00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([cid], [blgid], [usid], [cdes], [cfrom]) VALUES (3, 3, 2, N'yeyeyey heheh', CAST(N'2021-11-07 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comment] OFF
INSERT [dbo].[Feature] ([fid], [url]) VALUES (1, N'/auth/insertBlog')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (2, N'/auth/blogUpdate')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (3, N'/auth/blogDelete')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (4, N'/auth/updateComment')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (5, N'/auth/listUser')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (6, N'/blog/blogDetail')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (7, N'/blog/myList')
INSERT [dbo].[Group] ([gid], [gname]) VALUES (1, N'Admin')
INSERT [dbo].[Group] ([gid], [gname]) VALUES (2, N'Member')
INSERT [dbo].[Group] ([gid], [gname]) VALUES (3, N'Member <Banned>')
INSERT [dbo].[Group Account] ([gaid], [gausername]) VALUES (1, N'tiennq')
INSERT [dbo].[Group Account] ([gaid], [gausername]) VALUES (2, N'123@123')
INSERT [dbo].[Group Account] ([gaid], [gausername]) VALUES (2, N'HuyenTrTT')
INSERT [dbo].[Group Account] ([gaid], [gausername]) VALUES (2, N'huynk')
INSERT [dbo].[Group Account] ([gaid], [gausername]) VALUES (2, N'loandp')
INSERT [dbo].[Group Account] ([gaid], [gausername]) VALUES (2, N'nanlt')
INSERT [dbo].[Group Feature] ([gfid], [fgid]) VALUES (1, 1)
INSERT [dbo].[Group Feature] ([gfid], [fgid]) VALUES (1, 2)
INSERT [dbo].[Group Feature] ([gfid], [fgid]) VALUES (1, 3)
INSERT [dbo].[Group Feature] ([gfid], [fgid]) VALUES (1, 4)
INSERT [dbo].[Group Feature] ([gfid], [fgid]) VALUES (1, 5)
INSERT [dbo].[Group Feature] ([gfid], [fgid]) VALUES (1, 6)
INSERT [dbo].[Group Feature] ([gfid], [fgid]) VALUES (1, 7)
INSERT [dbo].[Group Feature] ([gfid], [fgid]) VALUES (2, 1)
INSERT [dbo].[Group Feature] ([gfid], [fgid]) VALUES (2, 2)
INSERT [dbo].[Group Feature] ([gfid], [fgid]) VALUES (2, 3)
INSERT [dbo].[Group Feature] ([gfid], [fgid]) VALUES (2, 4)
INSERT [dbo].[Group Feature] ([gfid], [fgid]) VALUES (2, 6)
INSERT [dbo].[Group Feature] ([gfid], [fgid]) VALUES (2, 7)
INSERT [dbo].[Group Feature] ([gfid], [fgid]) VALUES (3, 2)
INSERT [dbo].[Group Feature] ([gfid], [fgid]) VALUES (3, 3)
INSERT [dbo].[Group Feature] ([gfid], [fgid]) VALUES (3, 4)
INSERT [dbo].[Group Feature] ([gfid], [fgid]) VALUES (3, 6)
INSERT [dbo].[Group Feature] ([gfid], [fgid]) VALUES (3, 7)
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([uid], [displayname], [gender], [dob], [address]) VALUES (1, N'Tien', 1, CAST(N'2001-05-03' AS Date), N'Nghe An')
INSERT [dbo].[User] ([uid], [displayname], [gender], [dob], [address]) VALUES (2, N'Huyen', 0, CAST(N'2001-05-19' AS Date), N'Sai Gon')
INSERT [dbo].[User] ([uid], [displayname], [gender], [dob], [address]) VALUES (3, N'Na', 0, CAST(N'2001-09-30' AS Date), N'Thai Nguyen')
INSERT [dbo].[User] ([uid], [displayname], [gender], [dob], [address]) VALUES (4, N'Loan', 0, CAST(N'2001-02-17' AS Date), N'Ha Noi')
INSERT [dbo].[User] ([uid], [displayname], [gender], [dob], [address]) VALUES (5, N'Huy', 1, CAST(N'2001-10-11' AS Date), N'Nghe An')
INSERT [dbo].[User] ([uid], [displayname], [gender], [dob], [address]) VALUES (6, N'123@123', 1, CAST(N'2021-12-09' AS Date), N'Nghe An')
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  Index [Unique_Account]    Script Date: 11/7/2021 11:40:38 PM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [Unique_Account] UNIQUE NONCLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_User1] FOREIGN KEY([aid])
REFERENCES [dbo].[User] ([uid])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_User1]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_User] FOREIGN KEY([userid])
REFERENCES [dbo].[User] ([uid])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_User]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Blog] FOREIGN KEY([blgid])
REFERENCES [dbo].[Blog] ([bid])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Blog]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([usid])
REFERENCES [dbo].[User] ([uid])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[Group Account]  WITH CHECK ADD  CONSTRAINT [FK_Group Account_Account] FOREIGN KEY([gausername])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Group Account] CHECK CONSTRAINT [FK_Group Account_Account]
GO
ALTER TABLE [dbo].[Group Account]  WITH CHECK ADD  CONSTRAINT [FK_Group Account_Group] FOREIGN KEY([gaid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Group Account] CHECK CONSTRAINT [FK_Group Account_Group]
GO
ALTER TABLE [dbo].[Group Feature]  WITH CHECK ADD  CONSTRAINT [FK_Group Feature_Feature] FOREIGN KEY([fgid])
REFERENCES [dbo].[Feature] ([fid])
GO
ALTER TABLE [dbo].[Group Feature] CHECK CONSTRAINT [FK_Group Feature_Feature]
GO
ALTER TABLE [dbo].[Group Feature]  WITH CHECK ADD  CONSTRAINT [FK_Group Feature_Group] FOREIGN KEY([gfid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Group Feature] CHECK CONSTRAINT [FK_Group Feature_Group]
GO
