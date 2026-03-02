Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC3533555B
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 18:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772476570; cv=none; b=XG3CoIPpXE5Iin1G1IVGaG61HNtnz1y8fAQLB3a6bomurY5CGjQmUTm7Eiyh5BdhB4am0cnF1zlYFikDegytO8cST+yeG+aos412oaJCRl3t3axJ0kAjba9GlOMaYVlz9p5nkSWJD30GJCfTcmkYlct/IUglDDUuHRj0cfj45BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772476570; c=relaxed/simple;
	bh=gE+jXU5agoQWTZebEDnDXNxEhHacPNAY9q51lw7KMLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNj9qtSEVHfdYkg/OUEkbXmKwNfcrpLqv84/goF1D2UTvYWC2hL7d/Drsguc2qcOAjwLKLYfe9CIIHZHa5tHgEosGn1hFkJT15taSvlYkrjDfjvyM9LxEZ33L89CO3PZY59GY2mEJCk8WHqULJ9b1zCYFLL+y+xxQnIQ/i8GHNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mzCHPyne; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mzCHPyne"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ae3f822163so8135ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Mar 2026 10:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772476569; x=1773081369; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TNGbC+n/FkqePeOY//UBg6AI1QctrOX8iaSRimJodOQ=;
        b=mzCHPyneiY261XfAVBrXgOzej8xAJlb7jU8TJqzrwazDKr476xUrHUfPrUHFd5W1Yu
         K/nHuaLuK/0XVy+8AfnsEJkbklyOS48YJQnkygmsojCkhwRfDTbaCzHtQggvsFjkxDWG
         W1P6ZwapsdPgFssbMFegNd6ofWHwAs0kDlahVe/EBJ1pvSkuTbmFZgdsmak69sqRVHGb
         nJhxvCPQYcW87DOjpMoT+IOuZvoeS73LYdOWvFML6UtYW56tTWpNe26oF3P3DnVQlaSh
         aDVqc//WnkoaOTFuU0kNA0sMx0gQgXRbyOHpdMhn2DmVgsTas3QYakhoFjGJOAVsOe51
         p+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772476569; x=1773081369;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TNGbC+n/FkqePeOY//UBg6AI1QctrOX8iaSRimJodOQ=;
        b=hLN4SGdaaiYBtcM4xbhNnRXoTwCuS1iLs/bFS6YLiW9nXxiMsCcKVcOBcByucfYnjz
         MwgrXIt0JOK1WdYB4ErldATAAcZnkh8RHN9Iwis2h63F1/xXTwwK+g8rOywNE8laMjxi
         8n9cfNgAImp7BzP/JDtt3YwMpFqBvc+p3b3DpxtDuPPF2xuxxpjlhwNbCzu46Qtavs/T
         aKc5nGqIqSfAGRaY7jk2WmVvCLtmbCSniNpQX+MlNvwx7u7pqi1xaW2MjYdxjswa+VX+
         xRCn3e2CIjZtGnH+37j7OaogCTmX4eCesEMoxC0sCsj8ANBRFLAUGerYDuFYWQIfHn92
         G5Vw==
X-Forwarded-Encrypted: i=1; AJvYcCWlijyKWHgoZCW+Cl4q7TH473/RFDQ366ZPtdbWsO3cetN/j0p0G8mkRbLrLHZ91gsyMHsu6dQHu5OTEVAG7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWoT+6pd5D3bhne4MPaZu+fP9zWybXrWgrXCe0NOWtlkavx6zQ
	oUpWHVggPMhiZ6QZeiiKdwJFAMk8D7xZtyQRs/D/nUuL0hzXj67e0sPsggN/6jxAEA==
X-Gm-Gg: ATEYQzzuzCEFY0J6TgFk4xmeVdtzw7DzlUf2CBiY+5b6pmQHbw2dRvW/rqLQzIfvzAF
	8YY0k76IgVFQvfxIZj8sPfbyNK/N0R+eSo+iuTefDiIuwtVeY822P2eZXRsyKWBsNy1s2HOg5+3
	w2TaciGS5NCfBdKhGGH5qAPwf2Kc0K4JT1st/QK0d4B5MH/cQ3FzZL2s31oYYqxbIhbljgbWtTG
	Honr5DA0IJ3tUyccIpjN+HhuWjspvgChjLQ56o0EhGpdtPX8aFtJFZTTa22ZnTldpT0jFIAMgS6
	Uz+OCoidSmLYVMSPUv53iZ1FrpRm0ELbX9Fl+5aGYPOgbII5G7Ej9o3x3Fe9a8OTIAwvQ2VSGuJ
	bVKbmLCgpi0Wn/NUm4YH3XfD1mOTOy2jbnKKPD2nFaXY1cW2pH/xgTZzNJVBtPm171zIpPb5vQ2
	CdxVVYQgGO0E7IELrN8y4xr9O4uZCqoOMQw12RwtdHM4wNp+it/0A87M1Y5qFjeEwJ1Q6+Tgpi
X-Received: by 2002:a17:903:1b6f:b0:2a9:5ef5:399b with SMTP id d9443c01a7336-2ae3b553cd7mr4766455ad.19.1772476568598;
        Mon, 02 Mar 2026 10:36:08 -0800 (PST)
Received: from google.com (154.52.125.34.bc.googleusercontent.com. [34.125.52.154])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d94de6sm13941615b3a.24.2026.03.02.10.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 10:36:08 -0800 (PST)
Date: Mon, 2 Mar 2026 18:36:03 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Jann Horn <jannh@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-mm@kvack.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rust_binder: check ownership before using vma
Message-ID: <aaXYkwQ0Yg5b7sTb@google.com>
References: <20260218-binder-vma-check-v2-0-60f9d695a990@google.com>
 <20260218-binder-vma-check-v2-1-60f9d695a990@google.com>
 <aaXGZlfAmk-DCuBW@google.com>
 <CAG48ez2M4fj15gqyKrP7ADRUhNQZkpy9m+NSz2N=vo=PSefm0w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez2M4fj15gqyKrP7ADRUhNQZkpy9m+NSz2N=vo=PSefm0w@mail.gmail.com>

On Mon, Mar 02, 2026 at 06:28:17PM +0100, Jann Horn wrote:
> On Mon, Mar 2, 2026 at 6:18 PM Carlos Llamas <cmllamas@google.com> wrote:
> > On Wed, Feb 18, 2026 at 11:53:26AM +0000, Alice Ryhl wrote:
> > > When installing missing pages (or zapping them), Rust Binder will look
> > > up the vma in the mm by address, and then call vm_insert_page (or
> > > zap_page_range_single). However, if the vma is closed and replaced with
> > > a different vma at the same address, this can lead to Rust Binder
> > > installing pages into the wrong vma.
> > >
> > > By installing the page into a writable vma, it becomes possible to write
> > > to your own binder pages, which are normally read-only. Although you're
> > > not supposed to be able to write to those pages, the intent behind the
> > > design of Rust Binder is that even if you get that ability, it should not
> > > lead to anything bad. Unfortunately, due to another bug, that is not the
> > > case.
> >
> > This all makes sense to me. What I'm missing though is why not reject
> > VM_WRITE mappings all together? Is there a downside or something that
> > prevents us from setting this check?
> 
> You could, and it would probably do the job (assuming that you check
> for VM_MAYWRITE instead of VM_WRITE), but I think it'd be more of a
> surface-level mitigation than a robust safety check - in my opinion, a
> robust check should, at a minimum, confirm that the VMA being accessed
> belongs to the right driver, because other drivers might do random
> things you don't expect in their own VMAs. (For example, it wouldn't
> protect against interaction with a driver like C binder which reads
> PTEs back out of the VMA in binder_page_lookup(), makes assumptions
> about what kinds of pages that yields, and writes into those pages.) A
> driver should not be touching VMAs it doesn't own.

Alice just informed me the VM_MAYWRITE check is already in-place:

	rust_binder_mmap() ->
		Process::mmap() ->
			try_clear_maywrite()

I just wasn't aware of this, sorry for the noise.

I also agree with your comments. The following two safety checks should
be addressed by binder:

  1. mappings should be read-only.
  2. don't operate on unrelated VMAs.

(1) Was already covered and (2) is addressed by this patchset. So we are
all good here. Thanks!

--
Carlos Llamas

