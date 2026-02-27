Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638CA27603A
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 13:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772197353; cv=none; b=C8gMb4GSkngsigHYkoRf0KI3sMSSWkT50fyVhuFWgndabfvT3kgYeldpS2Mj4N7Srr1xiGuP/qP7E62ovqqkO9FC22ayE7cTkcQvdEVpq5YHcsRNpzRQ8KzVj+6qb67bT1cAnGdO+ElLMJEa6CfXoILiKMvSA4MAkKUEQIOt52I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772197353; c=relaxed/simple;
	bh=uzYqLggd1J3ruSnkOHZzlSQ4Ico+CcZ9oOE2mJRsSFk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MCDH2w9/mRHOxHsArzMD8oOqGs2JbEkObtGdYMH/NnfnvixJEuRgZD0hiNAUfUuzwWdNklMK6mKJgpaKfOEKiK6K7h0qb95lFOTfmTbqOMKwJVPLCnmD6GNIVTE3NSI1np4NdIO3Lbvv5pTdQ+Gsi33o1tgjsO9q2dsdA1OyyNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N5XbK4Nh; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N5XbK4Nh"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4836b7fbf4fso13981365e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 05:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772197350; x=1772802150; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7+OE6E+kryFBIhcFl9wc2Cm9uk0vShrlaAuBGorkTKs=;
        b=N5XbK4NhG357+qBqqmn5PJ3PvBasyFGZuX/xS5Kv7Hf7hwMLZO4HPPrwyYfNzrUcck
         UsBOCXEOfTeqZbxqNCSkE6qhCdKglNJwWzG2h9QX5wAI12emDlxzgy6UeUAT+B1YXG3I
         u3mvLSkXwIkB1PUBWQ5+xgaDcNAwZ0y7IOOc6SXhod3DOaYPzx0piMbQgDAFWYCJnBTF
         ZH8Dnbjb4VAJyv5FaXp1JUB004uJVlYrDQ4O3OSDQBHE1koh3bDIw7HuSkWWCMjuCTTW
         ft2OQzx48Ddtp8lfNOZP3O7gY2ywyl52CW0Lg/PoaAX+W1aNV0Q7Ecn7im91WQnAqHSi
         H58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772197350; x=1772802150;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7+OE6E+kryFBIhcFl9wc2Cm9uk0vShrlaAuBGorkTKs=;
        b=qiDeh64C1xeiceoD/G/7eRknI8X9EZzV4YMh+ggsbRyRnjDapVOtMcDLx+yiDauxj7
         HvUpIiBsghVM51TAGRDjWC4ZzaS893TPv3Ip1KtZT6zVHSg9LZhvO0SkQq2XxK89vIOO
         9ATUBnnSrZ4Xr4pRbx3rW3juAG0lh2Q19CE29IJVBE4YR6mt85z+kUZAVVidUBQv6vMb
         H2aMkib/TjXR7ZjSh84xPWRHX0ct4X8w42GrNCzLrfBF5U1o3oYBj78P17QsRiY/vWdA
         Ph9HwVyzScseeG2dRGt/OF0VwJMjSGF6jqDlJpAOzMepn85otVEWHwR3uB3iQeSta36/
         fTMw==
X-Forwarded-Encrypted: i=1; AJvYcCVfTBue2OX+k8JXoQvaK3qaQA1anneOfphg+T+KigMKxaTet9oREn2EFZi9qOBbavnwr8uUnD3jBJ/GDJ71tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwY4Rss+dOKBCZrFCNV0zFn9Nm4uo86MIskmzLF2gFMNNxsTSjG
	ePPapsrS1SYKkcD7JJdlEfcBue98DFfs2DHPqJ727Dk3i330sHbXX+2Amo1LyL6g7t4p3Qp6TYZ
	ZAD5xONpn567xinlfKQ==
X-Received: from wmsm28.prod.google.com ([2002:a05:600c:3b1c:b0:480:2e46:31e1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:190c:b0:47e:e8c2:905f with SMTP id 5b1f17b1804b1-483c9ba7b9fmr39802455e9.8.1772197349520;
 Fri, 27 Feb 2026 05:02:29 -0800 (PST)
Date: Fri, 27 Feb 2026 13:02:28 +0000
In-Reply-To: <DGPQSQCRYS7E.2443Q5A151I7H@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260227-close-fd-check-current-v2-0-b3347edbb310@google.com>
 <20260227-close-fd-check-current-v2-4-b3347edbb310@google.com> <DGPQSQCRYS7E.2443Q5A151I7H@garyguo.net>
Message-ID: <aaGV5NR9qo4Iah5C@google.com>
Subject: Re: [PATCH v2 4/4] rust_binder: check current before closing fds
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="utf-8"

On Fri, Feb 27, 2026 at 12:28:04PM +0000, Gary Guo wrote:
> On Fri Feb 27, 2026 at 9:34 AM GMT, Alice Ryhl wrote:
> > This list gets populated once the transaction is delivered to the target
> > process, at which point it's not touched again except in BC_FREE_BUFFER
> > and process exit, so if the list has been populated then this code
> > should not run in the context of the wrong userspace process.
> >
> > However, why tempt fate? The function itself can run in the context of
> > both the sender and receiver, and if someone can engineer a scenario
> > where it runs in the sender and this list is non-empty (or future Rust
> > Binder changes make such a scenario possible), then that'd be a problem
> > because we'd be closing random unrelated fds in the wrong process.
> >
> > Suggested-by: Jann Horn <jannh@google.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  drivers/android/binder/allocation.rs | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/android/binder/allocation.rs b/drivers/android/binder/allocation.rs
> > index 7f65a9c3a0e5..31a42738a99d 100644
> > --- a/drivers/android/binder/allocation.rs
> > +++ b/drivers/android/binder/allocation.rs
> > @@ -260,6 +260,10 @@ fn drop(&mut self) {
> >                  }
> >              }
> >  
> > +            if self.process.task != kernel::current!().group_leader() {
> > +                // Called from wrong task, so do not free fds.
> > +                info.file_list.close_on_free.clear();
> > +            }
> 
> If you're sure that this won't actually happen, perhaps print a warning if it's
> called from a different task but the list is not empty?
> 
> Also, I think this can be
> 
> if ... {
>     for &fd in ... {
>     }
> }
> 
> rather than `.clear()` and then iterate.

Actually, I guess there is one case. When the binder fd is closed, this
code may run from deferred_release() in workqueue context. Now, the fd
close logic is a no-op from workqueue context, so this patch still
doesn't change behavior, but it means the fds wont get closed.

That said, this actually matches C Binder behavior. It also does not
close BINDER_TYPE_FDA fds when you close the Binder fd without first
issuing the cleanup command for each live BINDER_TYPE_FDA object.
Probably not intentional, though.

Alice
