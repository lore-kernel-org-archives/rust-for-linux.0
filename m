Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D08349AEA;
	Fri,  8 May 2026 06:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778221939; cv=none; b=glhpyf1FXHmFG0HtBhES6IZCR9LJBw1/Kc/BibdMOTt/1Ja0BPSq/Sr35cC6osLyNhAO51c8f0S6Vy4ygb9n3hO1B8UMjrA8Ej+KcLu8gHft6Gfl3xMytJ7akTdhpOA40JszbEfbICM30LCniiuf6q9RkGiwqPiVUdMr4k6iJlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778221939; c=relaxed/simple;
	bh=Vx1UmoXSTVCb2X3CVpIxn1t7X7LjerLMOt1qWBN2Cyo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jeUAUWjsCBV5V3Fl5dMmSUk3ZwDsdBZ2oKLvdnDLUoXYBXd2q3WIegnyaUsDwgC4l+QH1V0yj4T25Bv4XYQDEj4IDBEFhY6YkmIl27vvClvREMC97/xLeRIHENLuRBzkcowvkzfDR6zRElQmjQ7pc1rqF/AzTLzsEu8Cpgs8Kwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V1DQ/YN0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V1DQ/YN0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACA5AC2BCB4;
	Fri,  8 May 2026 06:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778221938;
	bh=Vx1UmoXSTVCb2X3CVpIxn1t7X7LjerLMOt1qWBN2Cyo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=V1DQ/YN0vbl5eMEcdqkSWTrcN1Stmc1KcbY0yB/V4nDvohuqaDTu/dRkSeud06tCz
	 DtfKNw6LZjoHKF2oKPmAItoo71xdXpVXEd+q4hrHVt9TS1ZM1BLwh98+Zh20h7F0WC
	 S9sWcoDIryam+3E55THvcvNKuyd5MSqjds29EChRXcNtqzd5KUq/MVZUReNQh1bGV0
	 x9FL9QPhtAvPQvu0TWywydbRRGTVIZ3iofQ3MEqEuF6dPOxMEhqnZeRxubIWr6/KCR
	 EMArTYPG56w11cEB2CYAr85wAH/8PKjFXuRhAcI3BCrJxjB/EGRiXA6uuStxBKz2qt
	 JN7zWua8TRgeQ==
Date: Fri, 8 May 2026 08:32:13 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Shuah Khan
 <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2 04/11] docs: maintainers_include: clean most
 SPHINXDIRS=process warnings
Message-ID: <20260508083213.404c2bd8@foz.lan>
In-Reply-To: <72626637-2ed7-40c6-b5fb-75664e59e377@infradead.org>
References: <cover.1777987027.git.mchehab+huawei@kernel.org>
	<b57d83081c28aa52683b403f8836d098fcdd8530.1777987027.git.mchehab+huawei@kernel.org>
	<72626637-2ed7-40c6-b5fb-75664e59e377@infradead.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 5 May 2026 12:53:01 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> On 5/5/26 6:25 AM, Mauro Carvalho Chehab wrote:
> > building docs with SPHINXDIRS=process is too noisy, as it
> > generates lots of undefined refs. Fixing it is easy: just let
> > linkify generate html URLs for the broken links when SPHINXDIRS
> > is used.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> 
> Is this specific to SPHINXDIRS=process?
> I don't see anything here checking for "process".
> 
> If this is process-specific, why?
> Or is it just for SPHINXDIRS="<subdir(s)>"?

It is specific with using SPHINXDIRS=<subdir> where <subdir>
contains one of the two meta-tags defined by the extension.
Yet, right now, just "process" subdir has them:

	$ git grep "\.\. maint" Documentation
	Documentation/process/maintainer-handbooks.rst:.. maintainers-profile-toc::
	Documentation/process/maintainers.rst:.. maintainers-include::

See, what this patch does in practice is to avoid a massive flood of
warnings if one uses:

	$ make SPHINXDIRS=process htmldocs

As ".. maintainers-include::" would create lots of ":doc:" references
to documents outside "process" subdir. With this patch, they're
converted into https links to docs.kernel.org, thus cleaning up the
warnings, while creating an output that will contain working cross
references.

Thanks,
Mauro
