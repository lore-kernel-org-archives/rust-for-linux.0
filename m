Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4259363099;
	Tue,  5 May 2026 05:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777960650; cv=none; b=tmyAfJnTkct02Ju3WdoRC4pw8BDKgdehK3EojaloGpKDADU7luCyMYE0VXNiR7gZ19vJ/8s3B3hknsZX9JKklYhf+yln4rey2RcovokNwaOQMW7VKnE3ai8UU24NgQ6fsMk+IQgd8yZNovFHx5I/aiY7lMP5DIR3oodp3R2ybQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777960650; c=relaxed/simple;
	bh=9DEUkxjk8HiiowquE8eOkivB7wjOkmTD6MTGs6VTlm4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D58frYyg17kcLoz/PWabshDzLwZGMHdR9M+hHO/n/yCxoYlAUxuazTpsZyL0tJDpvxW52GyrgadP1TyPeYVrgL9vf3AQtNLL4tEhZ3QOHmhi0PKFcvJjOx/nukXxP7JYTbGPt+mC//8vwvztuaCMl1K4uRhqHFKvXdAGwyWL0YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELkS2Mdk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELkS2Mdk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18DAAC2BCB4;
	Tue,  5 May 2026 05:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777960650;
	bh=9DEUkxjk8HiiowquE8eOkivB7wjOkmTD6MTGs6VTlm4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ELkS2MdkJW54twsAz30BqI80BHxF/JjgnTWoXaNjm8X8/cD4KYMoZjzyNG4MQQs99
	 NfjWm1kHVYEUSDQpfxf9+plutzRofT1w2eBz0Yr2i6drAUQkQM7cTPiUTEES3wcVk/
	 NLDmHAKAEusdc0RyZ+1/RCUxlYKGI3WcBmfwuAcmVamJiysoehbo4ts7kd3HmP6IKT
	 uUMei8lCJmh/3ulA8aKCIIgrm7avcDYfO4NdAbtn9XFvfXslt1a/ZqlKIqBjS0HhPy
	 fibXZSHyGglvqkkMK+1zTRgX1CDhF5h+8goxXw9KtMY0h9MvIY8Cu27lCzyOM4wx8+
	 A64nqdIJgApvQ==
Date: Tue, 5 May 2026 07:57:25 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Andrew Morton	 <akpm@linux-foundation.org>,
 Matteo Croce <technoboy85@gmail.com>, Shuah Khan	
 <skhan@linuxfoundation.org>, Matteo Croce <teknoraver@meta.com>
Subject: Re: [PATCH 2/9] docs: escape ** glob pattern in MAINTAINERS
 descriptions
Message-ID: <20260505075725.0f3d2a6b@foz.lan>
In-Reply-To: <0b127006e552de855ba7d33c15d2199436a001cb.camel@perches.com>
References: <cover.1777908711.git.mchehab+huawei@kernel.org>
	<31f673089e2a83dc1fee17d47784579874476ca5.1777908711.git.mchehab+huawei@kernel.org>
	<c2efc1a7-4406-4590-b863-5f258f3cae50@infradead.org>
	<0b127006e552de855ba7d33c15d2199436a001cb.camel@perches.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 04 May 2026 20:19:50 -0700
Joe Perches <joe@perches.com> wrote:

> On Mon, 2026-05-04 at 14:20 -0700, Randy Dunlap wrote:
> > On 5/4/26 8:51 AM, Mauro Carvalho Chehab wrote:
> > From: Matteo Croce <[teknoraver@meta.com](mailto:teknoraver@meta.com)>  
> > > 
> > > Escape '**' in the MAINTAINERS descriptions section to prevent
> > > reStructuredText from interpreting it as bold/strong inline markup,
> > > which causes a warning when running 'make htmldocs'.  
> []
> > It's nice to eliminate one warning from 'make htmldocs', so this is good
> > in that regard. However, there are still multiple problems (not Warnings)
> > with '*' characters in the MAINTAINERS file:
> > 
> > 1) 	   F:	*/net/*		all files in "any top level directory"/net
> > 
> > In the html output, it shows "/net/" italicized (that's what one * does).
> > 
> > 2)	   F:	fs/**/*foo*.c	all *foo*.c files in any subdirectory of fs
> > 
> > In the html output, it shows
> > 
> > 	F: fs/**/foo.c all foo.c files in any subdirectory of fs
> > 
> > with both occurrences of "foo.c" italicized (dropping the '*' characters).
> > 
> > These 2 examples are actively wrong.
> > 
> > [adding new:]
> > We would be better served by just putting file patterns inside ``fs/**/*foo*.c``
> > quotation marks IMO.

The logic actually does that already:

        #
        # Mark paths (and regexes) as literal text for improved
        # readability and to escape any escapes.
        #
        if field in ['F', 'N', 'X', 'K']:
            # But only if not already marked :)
            if not ':doc:' in details:
                details = '``%s``' % (details)

The only reason why this patch is needed is for the header part, which
describes that "**" is allowed. If you look at the final code, this
replace code will be only at the header parsing logic:

    def parse_descriptions(self, line):
        """Handle contents of the descriptions section."""

    ...
        # Escape the escapes in preformatted text.
        line = self.linkify(line).replace("\\", "\\\\").replace("**", "\\**")
        self.header += "| " + line

> > 
> > Ah, similar to what you do in the table output.
> > 
> > Oh, with one little glitch:
> > E.g., in the very first entry for 3C59X NETWORK DRIVER,
> >   F:	Documentation/networking/device_drivers/ethernet/3com/vortex.rst
> >   F:	drivers/net/ethernet/3com/3c59x.c
> > it looks like automarkup is applied to the Documentation file so these
> > 2 files are displayed as:
> > 
> > networking/device_drivers/ethernet/3com/vortex, drivers/net/ethernet/3com/3c59x.c
> > 
> > with the Doc file underlined and missing both Documentation and .rst.
> > Or maybe that's what you intended since the automarkup link does work.
> > It's just not what I expected. Oh well.  
> 
> Please stop trying to format MAINTAINERS into rst.
> It shouldn't be formatted.
> It's simple text.

MAINTAINERS is not a simple text. It is a machine-readable text
database.

Thanks,
Mauro
