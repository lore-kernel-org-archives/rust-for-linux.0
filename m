Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9283E3C40;
	Sat, 16 May 2026 17:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778953045; cv=none; b=X4UjLeqXzgGXT95RyYJwNCmZ5IjnI4e9reWZCqbFEBVgoJvxzoNwQKf0tlUi3qDwF9aG0uzx2sRsS+orkkZ/vHP+6iQBMp7xY+pC7UcYu1SMNTAZpJqB9wRSlPRQUNm5HN2CME2kV9TpiQ0VrBUgd6C/7kjVKvVn4i/CCVGEEQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778953045; c=relaxed/simple;
	bh=FHwUdEPySuutTuYOs8gTpD8WcFQFUPc/JL2wf4pAzHk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uTftpQun/VgrpWc26cMiX9yXOqa7bdxskHpMZafsiA4ua4IGZwctBG7Qa3XOFMN1pA/++x/+fWv+yFMxA0/KlNL184SM1bJOq7G+Ytox6ZjUERIwrfY8rfGLEWZBbF/TGEJHMUi/UJ7oKStNGEQBPkwf/Y96ErvqdImQbAFuNwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SIUsUKMK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SIUsUKMK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561E0C19425;
	Sat, 16 May 2026 17:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778953045;
	bh=FHwUdEPySuutTuYOs8gTpD8WcFQFUPc/JL2wf4pAzHk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SIUsUKMKESVG0uHB1xeEWJy/bmpKsKC3iveAUtIZCXuGl4UpJa4BMDsPLSep1GPsH
	 Put/xuVq6Qb9BvQp+s7VWemxPAyrgToW8hiod/neBgFvIiqmeoJo+rdXhsJ8nwIF2A
	 9rkpTWtbVyQEOhelu2IRyF5l/QMDOIgUuk6TmD+pPBbiPf1a0cYBg1XanFqqZq+b/W
	 9KvKFVqhe6erXeNEI6AfuvydQk6ekE/aUm/MDvaWOE/AcPqCL9YKk2XPCAXz37d7lF
	 ghv9MamTgmv9gUlqLmjjda76HCQFbo/ukE31UMitJDGMw5BBIoQXubiVIVHSsY2GMX
	 T9zrWMLL07JUQ==
Date: Sat, 16 May 2026 19:37:18 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Alice Ryhl
 <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, Benno Lossin <lossin@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Gary Guo
 <gary@garyguo.net>, Joe Perches <joe@perches.com>, Matteo Croce
 <technoboy85@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, Trevor
 Gross <tmgross@umich.edu>
Subject: Re: [PATCH v3 00/13] Improve process/maintainers output
Message-ID: <20260516193718.0f01ddf2@foz.lan>
In-Reply-To: <87zf20rcjk.fsf@trenco.lwn.net>
References: <cover.1778309595.git.mchehab+huawei@kernel.org>
	<87zf20rcjk.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 15 May 2026 08:07:59 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Hi Jon,
> >
> > This series improve the output at process/maintainers: instead of a
> > pure enriched text, the maintainer's file content is now converted
> > to a table, and has gained a javascript to allow filtering entries.  
> 
> OK, I've applied it.  

Thanks!

> I've wondered about including the MAINTAINERS
> stuff, but I must admit that the search box is kind of cool...

IMO, with the search box, this is now a lot more usable, and should
likely be helpful to the readers.

Thanks,
Mauro
