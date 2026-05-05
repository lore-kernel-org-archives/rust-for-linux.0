Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7093A3CAE6B;
	Tue,  5 May 2026 06:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777963603; cv=none; b=rbhQFmU0lZqJFsMIJ6p4fpXmML439FquLwt/NILX44Q4b9YFwzgZvngQWRGdf8TNujjQ+TQhVcXu1XVR8MVf5q8VkV3B6IfpU90CGnPWLpIXEVIsW1ZjqTMWphHmBdrZCsfBcPVFdDM2oD7AOlOcM1wJ9+qPpRkuAw+pISmJGtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777963603; c=relaxed/simple;
	bh=UNx5qgVVf2duk/xUmzJcW9nTDuiX5GrcXj1CTez2VVg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sLLpx5jjT2t6Yx3cBy9LFtnVJ9Wy2PGIUeIp2S/pr7HRz8KcvUlV9PPtbvaHwxyt/K+pNy3uqCFlBlveXLIxdAK2yOQr6O3acQU+BeTcO7tqyrpLo9IaJkezzxYhHfX75e+bw4PGGXHpMlyccUwK40nOidSaf/POT7BxmWT+49c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e38fVldD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e38fVldD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35B8C2BCB4;
	Tue,  5 May 2026 06:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777963603;
	bh=UNx5qgVVf2duk/xUmzJcW9nTDuiX5GrcXj1CTez2VVg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=e38fVldDMtDx2thtjcJoWX9kDk2rmjjs7EH8ZwF59Yat+GXHaUCBnhubvctZG7PVH
	 BBpkYFRjBNvwVfpsn1Pr9VKMWGaFQHLm99+nIm7Ljl7tJNKlD76UhJFVD4XCVOAJap
	 xECtzXBQ/Whd0TDWyzESCE20dI7pzENXMcvQLovKq3inI3+QoTEpFDkLOQ4YotJFu0
	 ZmahRONxHAxlkFkkjpfACZJ36YZQ01EM99sEIezpxIcYIREc79DIBUxrF4Zu5NBZkY
	 OBa7fD21MyqP/t407swmVOA6krdu21NR/DzKZVecLcvcfIbPXZQcajQkp6pC12b64+
	 VvS8pUtr0b68g==
Date: Tue, 5 May 2026 08:46:37 +0200
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
Message-ID: <20260505084626.47011bd1@foz.lan>
In-Reply-To: <20260505075725.0f3d2a6b@foz.lan>
References: <cover.1777908711.git.mchehab+huawei@kernel.org>
	<31f673089e2a83dc1fee17d47784579874476ca5.1777908711.git.mchehab+huawei@kernel.org>
	<c2efc1a7-4406-4590-b863-5f258f3cae50@infradead.org>
	<0b127006e552de855ba7d33c15d2199436a001cb.camel@perches.com>
	<20260505075725.0f3d2a6b@foz.lan>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 5 May 2026 07:57:25 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> On Mon, 04 May 2026 20:19:50 -0700
> Joe Perches <joe@perches.com> wrote:
> 
> > On Mon, 2026-05-04 at 14:20 -0700, Randy Dunlap wrote:
> > > On 5/4/26 8:51 AM, Mauro Carvalho Chehab wrote:
> > > From: Matteo Croce <[teknoraver@meta.com](mailto:teknoraver@meta.com)>  
> > > > 
> > > > Escape '**' in the MAINTAINERS descriptions section to prevent
> > > > reStructuredText from interpreting it as bold/strong inline markup,
> > > > which causes a warning when running 'make htmldocs'.  
> > []
> > > It's nice to eliminate one warning from 'make htmldocs', so this is good
> > > in that regard. However, there are still multiple problems (not Warnings)
> > > with '*' characters in the MAINTAINERS file:
> > > 
> > > 1) 	   F:	*/net/*		all files in "any top level directory"/net
> > > 
> > > In the html output, it shows "/net/" italicized (that's what one * does).
> > > 
> > > 2)	   F:	fs/**/*foo*.c	all *foo*.c files in any subdirectory of fs
> > > 
> > > In the html output, it shows
> > > 
> > > 	F: fs/**/foo.c all foo.c files in any subdirectory of fs
> > > 
> > > with both occurrences of "foo.c" italicized (dropping the '*' characters).
> > > 
> > > These 2 examples are actively wrong.

Heh, I read this too quickly: you're talking about the header descriptions
where we have:

    F: *Files* and directories wildcard patterns.
       A trailing slash includes all files and subdirectory files.
       F:   drivers/net/    all files in and below drivers/net
       F:   drivers/net/*   all files in drivers/net, but not below
       F:   */net/*     all files in "any top level directory"/net
       F:   fs/**/*foo*.c   all *foo*.c files in any subdirectory of fs

Yeah, you're right: the header parsing logic won't handle this well.
This should do the trick:

    def parse_descriptions(self, line):
        """Handle contents of the descriptions section."""

        # Have we reached the end of the preformatted Descriptions text?
        if line.startswith("Maintainers"):
            self.descriptions = False
            self.header += "\n" + line
            return

        # Look for and record field letter to field name mappings:
        #   R: Designated *reviewer*: FullName <address@domain>
        m = re.match(r"\s+(\S):\s+(\S+)", line)
        if m:
            field = m.group(1)
            details = m.group(2)

            if field not in self.fields:
                m = re.search(r"\*([^\*]+)\*", line)
                if m:
                    self.fields[field] = m.group(1)
            elif field in ['F', 'N', 'X', 'K']:
                line = line.replace(details, f'``{details}``')

        # Escape the escapes in preformatted text.
        self.header += "| " + self.linkify(line).replace("\\", "\\\\")

I'll address it in v2.

Thanks,

Thanks,
Mauro
