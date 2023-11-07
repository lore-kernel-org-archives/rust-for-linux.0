Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E267F2A1A4;
	Tue,  7 Nov 2023 22:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="lYYqHj8z"
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 016C8EA;
	Tue,  7 Nov 2023 14:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DyHxqJnOFuR+aFi1V8te8XlpI7eFCaJZHQJs/PHMnxQ=; b=lYYqHj8zeHAk+tGdedXtNcKnS8
	GYeKYqmRW8OBwa8Yw8ailg20K/jhnqGdeL79uAYnKB+LhjOCh21uAt3K7RxvNpSt3UX5JJ599kmxQ
	4p4tkiSA5zAzgsMpwQHZPQ+mf+G1TbiaOp10bgah/kug2fUoFbhOmjvhgzZleerkQnPl4HGoC0zCw
	Sf2zOwqBFpZ3nQRcyArObM6QRia7U/Qt4QLPeVRzkz+hf9TOwHeCp8hgrP4FU4yLL+LUIdXmBTJus
	OX8R8xEWqAn7g5x03h2JZgk5rAjCeIMsWWJI7AthQzoflgVgl5l+wMojeMZAfjrjYO159ZqpIfhui
	Q/JSZXSg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1r0UTJ-00Ci2k-0a;
	Tue, 07 Nov 2023 22:22:57 +0000
Date: Tue, 7 Nov 2023 22:22:57 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Matthew Wilcox <willy@infradead.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fsdevel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Wedson Almeida Filho <walmeida@microsoft.com>
Subject: Re: [RFC PATCH 10/19] rust: fs: introduce `FileSystem::read_folio`
Message-ID: <20231107222257.GV1957730@ZenIV>
References: <20231018122518.128049-1-wedsonaf@gmail.com>
 <20231018122518.128049-11-wedsonaf@gmail.com>
 <ZUq3nZgedcA5CF0V@casper.infradead.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUq3nZgedcA5CF0V@casper.infradead.org>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Tue, Nov 07, 2023 at 10:18:05PM +0000, Matthew Wilcox wrote:
> On Wed, Oct 18, 2023 at 09:25:09AM -0300, Wedson Almeida Filho wrote:
> > @@ -36,6 +39,9 @@ pub trait FileSystem {
> >  
> >      /// Returns the inode corresponding to the directory entry with the given name.
> >      fn lookup(parent: &INode<Self>, name: &[u8]) -> Result<ARef<INode<Self>>>;
> > +
> > +    /// Reads the contents of the inode into the given folio.
> > +    fn read_folio(inode: &INode<Self>, folio: LockedFolio<'_>) -> Result;
> >  }
> >  
> 
> This really shouldn't be a per-filesystem operation.  We have operations
> split up into mapping_ops, inode_ops and file_ops for a reason.  In this
> case, read_folio() can have a very different implementation for, eg,
> symlinks, directories and files.  So we want to have different aops
> for each of symlinks, directories and files.  We should maintain that
> separation for filesystems written in Rust too.  Unless there's a good
> reason to change it, and then we should change it in C too.

While we are at it, lookup is also very much not a per-filesystem operation.
Take a look at e.g. procfs, for an obvious example...

Wait a minute... what in name of everything unholy is that thing doing tied
to inodes in the first place?
