Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B9346B5
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Dec 2024 10:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733395711; cv=none; b=iOkrBZoFCIIt0qOieMZLH+qfxwL7HJM7JLWFz8W1YvyldsE99v5MUV2lrWnGvI8av0xvtHjqMJ0e07zGMIaD0TyLD3uw1mYj4mKJsGX78z8IWXc7IYzQDleZ4hZ/+mBMXdL8M3QP+CDb2Fdo8VLeDkZNlcpSSHB7/RySfGuKoh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733395711; c=relaxed/simple;
	bh=IxTz9zgttBOQ+lH0ph6RIITGv0Uth2xEdLeUBCMC6Lc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aCX/f9YOanUZtqJIGUkt6Kd811pFqf1UxEvSd6p6KDvPtDNPqyCWqdCt9pG0YrHbv+U3MsAGjn8WUL/5upyF1DW1aV3CQTB26NFPFw+jkSN9+Okmi0WHaff/ILtwDWDLiRG9kXd7ZEJNKsOtlJs5US6WWLS2R7FX3rvKJ91By6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K8nR0UJo; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K8nR0UJo"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4349e1467fbso5002635e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Dec 2024 02:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733395708; x=1734000508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxTz9zgttBOQ+lH0ph6RIITGv0Uth2xEdLeUBCMC6Lc=;
        b=K8nR0UJoOB1y+E4LvGEuq4sXIjnHqJ+Bt/bayZdAdL7B7YZrBsgvj55Veggv9wbrK9
         QBjqDfT/LliaMYHY/ZA8ALXs4BkfjBtmk76kAQWvfUi1UaF5KiUahIVqgV43PtejVsOA
         NoFSbLQAX0Co67hqLmGjOsHRja5Ijg5Kgb7GBA+eOL4OHkys1AFZol1uvA0zNQUIxXh9
         XxkH4dKEwa1Qs0Dcn0L2TFeA96JC8io8nqD3dmR7CXZ6/A2URahsj8j7sHpfG+QX76oI
         acXNI/VWsEBwt1d9z2luDYYaAkkyXYdrXWX7FIg88gwBWBVQdKw4jKTfE0LVW/oaYOXs
         sX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395708; x=1734000508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IxTz9zgttBOQ+lH0ph6RIITGv0Uth2xEdLeUBCMC6Lc=;
        b=iNsdDRom62fA4SyAm3hOtKXttkKbifAhuypgAA85lkCHGyZtCvA/gmGG57vJ9PDMmf
         ziMGSQTZFwo0cnBflyJ4X4ILnynu/jA0ur05IPYFOwIaDik7X6XY/geDQOb13OY08QA3
         G430MAqL1wBKGEbqusplHbSO3b3l45abnevVmZEnBFHCj0lwJZws0ZqKUifBYR0agBnh
         cbnRmsD9KrnW75crfXoc44sT8LVNvEXsubV8uwkiomUpy3A60/5Xyo4A7fmRkv53eBV3
         PPkHQUPSNeUlzisxe9gmKHRUWPZrWQszQ9DuMy471iP9rt177Hjvalg2o+TEZeXfVp2L
         6ZCA==
X-Forwarded-Encrypted: i=1; AJvYcCWfq8KdVwU2/SDl8epLrM0DvKcBErvYWQkk3+AeJORsBg0/wJ9eO6w8EkzPU3RVsE3n0bCP2UjML+BtF2R69A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSrpEq4BYRE80JLLLuRcacRu5jrnJGciKihebXNi9I0TdLCmN9
	kGhBozgT86/4hd4pZVdCf34XZOpj9cCzL/Eu6SrWYG611gq63/gckmz7r5+Nt8PaGC4R+8qBkib
	Gv1oEP9rKj7fi+Vb7luWKMVdTYlvMyQEN8A/Y
X-Gm-Gg: ASbGncs2k+gE7KOAKRV+QgYCcV5sQ+Us2yyKLCIYbW/h3QlqspV+/PEtxA3Qd8UoEFi
	ltSzipAS4/IIim3ZH0PZkqU6MU0gs8Um3Znl3/7evGjHC5mTefC+EwLTrMfE8TA==
X-Google-Smtp-Source: AGHT+IEbHnZx89I6BS82qCs+JQ5CGtVbg/W2xXe2U7Jo5dGn4llV3v/F1YKlT4a62G5qQqKIfepFCQ6XOik9Hc67qu8=
X-Received: by 2002:a05:6000:2811:b0:385:dfab:1644 with SMTP id
 ffacd0b85a97d-385fd3f502amr5477346f8f.33.1733395708123; Thu, 05 Dec 2024
 02:48:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241129-vma-v10-0-4dfff05ba927@google.com> <20241129-vma-v10-2-4dfff05ba927@google.com>
 <CAH5fLgjxmpcLJwj5k85O39R00+vRRixA6i3xeK1STe_LQLHkTA@mail.gmail.com> <ab86d283-7393-4b11-b08b-ced744de7f82@lucifer.local>
In-Reply-To: <ab86d283-7393-4b11-b08b-ced744de7f82@lucifer.local>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 5 Dec 2024 11:48:15 +0100
Message-ID: <CAH5fLgg9ay1tWpKo91hYXn0dmj2Gzk1mZLvf031nnTzKbQbTZA@mail.gmail.com>
Subject: Re: [PATCH v10 2/8] mm: rust: add vm_area_struct methods that require
 read access
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Vlastimil Babka <vbabka@suse.cz>, John Hubbard <jhubbard@nvidia.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2024 at 11:45=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Thu, Dec 05, 2024 at 11:40:03AM +0100, Alice Ryhl wrote:
> > On Fri, Nov 29, 2024 at 5:32=E2=80=AFPM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > >
> > > This adds a type called VmAreaRef which is used when referencing a vm=
a
> > > that you have read access to. Here, read access means that you hold
> > > either the mmap read lock or the vma read lock (or stronger).
> > >
> > > Additionally, a vma_lookup method is added to the mmap read guard, wh=
ich
> > > enables you to obtain a &VmAreaRef in safe Rust code.
> > >
> > > This patch only provides a way to lock the mmap read lock, but a
> > > follow-up patch also provides a way to just lock the vma read lock.
> > >
> > > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
> > > Reviewed-by: Jann Horn <jannh@google.com>
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> >
> > It looks like binder needs a way to check whether a given vma is
> > associated with a given mm. I guess we can do that by adding a method
> > to VmAreaRef that returns a &MmWithUser.
>
> Presumably this would be with a lock held to ensure the VMA doesn't
> disappear from under us?
>
> I guess that's implied by possessing a VmAreaRef in the first place.
>
> I also suppoes that the mm having users is implied by you having the VMA
> that implies a lock held on it :)

That was what I was thinking.

> So that's probably fine then, as long as you can implement some sensible
> means of comparison between a known 'given mm' vs. the &MmWithUser.

We can use the stdlib function core::ptr::eq to compare the address.


Alice
