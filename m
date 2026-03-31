Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7643D9021
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 11:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774956740; cv=pass; b=EQqCTonjybQ5OM9nmrVFdO21Z6xCfWUy3v6bmlKMO4euWAhUzFQwhLWuvr/TkqB0E8LyPdgiDJV/YklVT5qdOR0Zor98GOmfL0fozji8c++GHujMnvFH4rTHI/fIOAsNEHJ7y+oS6pqbXl3n1Xq7s/kvXEfyuR+eIkOTki6yEx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774956740; c=relaxed/simple;
	bh=M67a/b1x6rgEx0jm9LICh8Vkeoo3mKrczTQasuX51XQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n5Wu5B5h94wbTuy3WtBvDZIdXmXt+YFz2dFaNaZIbnHcuHHVz34gasmrzDkAmACgo28E/LM1pUn/yoH3q7AyJPK9eYnM4ZtL9pHIJj61BVly6oA9Quq1gI2Jw+Sn9yW3Ei6oNpxabyO7+7maLpvi71CejXtJbsih7qNMltdtNt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wDTLVZCK; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wDTLVZCK"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486507134e4so64156575e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 04:32:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774956737; cv=none;
        d=google.com; s=arc-20240605;
        b=BWZGed9BqVhumPxZ5etcj5bsdNRrtCErLsXnb73PyZiAOimqP7jp3C4AOQ3gMh+J7I
         NWjVVKgO/XHa0c+CsUIxfw6RBdij2ejYonxOk21jXHJcd7xoYz9nSsvftGzmtF//B6z3
         DDCvXFRqL9R36hlpQQ/1S51ikUiEM9MbHEo1XmUABZOUMKMtMc303yJImnKsEKiUc4r8
         pfQ/4A0EX8BS/JR6eREXn453eRefCmFWFd1aQR5qzLkWk0B2AGab8Gqb14BV+Z2s/QBw
         XwWlWyVkrKfHnpzXBG3Xn+YCOIcn2SCNpJBdBNztndXvknV2pouzBb2dNRqgFKCXR+t9
         VDuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M67a/b1x6rgEx0jm9LICh8Vkeoo3mKrczTQasuX51XQ=;
        fh=FBWnc3/Kt6TM+ZCShMs+X0/+OYnGsEyAkfosh5VSb8g=;
        b=YlmN3afIAoxXnxMm2njIORwKGtXcus8aIbp1qhTrRpw5wZcs47pAPy2KfvXiwyXu8+
         TPmFsXpOj2ez7rUiERpI5N8NpU6eCubfyA2T+l4qIU8Ob8nTlAarXTNHE5JH97S5OkQw
         D7dwCY/3LTD+sz4B+27tbDiAvlbX4vNlOr5s5UvdiYN6DAuESXPU6WjoMdXyrhFx1qQw
         hxY4u6XHuc4Dcm82xjRov6Qyg2++UM23YA8atYViTXk2Q1l0xiHJ0wQmv7XtBaP/P8yT
         KUP6LCMQxnRZndhzkUTjXR1TJ1kerTxsTS1kYMzgm3onA+DmDXVjEs+IK5V7RhvMa6wk
         RPxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774956737; x=1775561537; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M67a/b1x6rgEx0jm9LICh8Vkeoo3mKrczTQasuX51XQ=;
        b=wDTLVZCKHgkLffcXKyPHHY1umky2v/wPPV+XVOED7uEBcvsiokpRxm2768xWbLVpZ0
         cD2EFrHfkBJqX0QP+qPOmvmP7aTzBDYA1HfF5Zkj4RCso3MDfOTPaDses57PV2WfQs6u
         R6AGZWmsNEIQMpYHVLuZtRa5Wxv7jJ0LCy79UAn+Au6NHQATvJnYXtlDDaKuzmJ8gMUw
         a7JPNM6V2ZPzy68ApRgGkZbqV8/WoSfMCyunUZEvrHlsAo8R0FYCqAvRL+/3KaOqtJbr
         HVZrWgohBj11B8tSGknV0Wy8A6cvm2/kh87U+jrx4i/FxRRkWHLgoQmWzMmq7eKPEODy
         gOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774956737; x=1775561537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M67a/b1x6rgEx0jm9LICh8Vkeoo3mKrczTQasuX51XQ=;
        b=J3H7LoqXstCEvRpskg3p/5vuyE7OuVi9mmC0BkOiuxvbfGrJLR82KbLL2T31M4LE0F
         A3BBcDfE93VIQl70Gsv8/q7HoAyQrLh0E1/+iGvqzJh9h5ZW0N/uwjaTdo9geNfhnyEn
         XcvR2vjRyqx7e2SIyekBWGNNwrCXpBTyKNnaNBhBaPVobOHpvVVd8Zrf4DEg39kk0pjW
         Peav5xazo+GG3ZbHkz33O35ZpEImyL3crD4RAXGpTRp1I5MIGuN26E+zkK8cXnwqe7g6
         Yj0aujhq8UhKtqHBPQlhe24J6u0beRs4vrUSPmaZbj/8lmRPdDM0Kuxz2hZsQWV+DYxk
         evwg==
X-Forwarded-Encrypted: i=1; AJvYcCUBtUJPcM4Iink/ES4RfQlNkHwPznP2BqXOeuxHmuR2A2VAljaaF+gbTFwll9pJWO4CUiVC85jcb3fVWNH/xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtXB3NyM+tVcc0VLOo37g5w7kWhh/oz2kb/XT/95gNKMP051cz
	7NPABbF3doW91o0SAW1UgCZG+/gIVlbAgTYdlMJFSksezLFHjvAnRRRVhTFa3PWPb2y+GmJ9DqC
	A2gqwf8Y4Yyzq7/siQhEpUks1TV2DqpQENr2TDdMn
X-Gm-Gg: ATEYQzxGUcy9a8mXnlQBd72YLxSyddd69ypcfaC+EKaB/w7TzqVnMprUn1e8GWZYbUH
	jLaL4xvfIsBA9a0Xuh6bD2qZSORCqJUqkfnlK8XdMhGQUlUXxnmGAFH+e3JJERJaGbWqbu1sj2o
	I5EHVc9Zb99oY33qKO8dpIOJMmO5Fa5brOnUR0zwKfw6Z3PmCdn/Jhfx8ny4/IUu9TNK1+epbZL
	YOSU4IOkw2O5KaHaEjU2N+Uc+VP7Ud6AckjM9k+ydyIBpJY4t96U62xR8ca07b/OJJzMRfkVhV5
	37sLdED1ROLHrF2iP90FSI1lxiK2piyLRWKKBw==
X-Received: by 2002:a05:600c:638d:b0:477:76bf:e1fb with SMTP id
 5b1f17b1804b1-48727efadcamr273504385e9.16.1774956736497; Tue, 31 Mar 2026
 04:32:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202603121235.tpnRxFKO-lkp@intel.com> <20260313213638.GA147391@ax162>
 <CANiq72mzEzjNg7O_2dWT_6QOJvJ3TwV+HyxNd_F4j6v9C+pc7A@mail.gmail.com>
 <2026031422-catsup-rectal-f886@gregkh> <CAH5fLgixE9MGXxNEnU5b0EXdgLQoTs5CMv_0OdnfCX3v=coUpw@mail.gmail.com>
 <abVG0JypVhDxx1Tt@google.com> <2026031444-wriggle-tradition-245f@gregkh>
In-Reply-To: <2026031444-wriggle-tradition-245f@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 31 Mar 2026 13:32:03 +0200
X-Gm-Features: AQROBzCQEjffcE5il2ENOqxKPlkZVapSxJMQJFQeH4ua_CsBeZl83tkO6WEAH3c
Message-ID: <CAH5fLggMZM3kYWO3xqb4o-mQG27aCYOmiiODW67CKLTstkB-PQ@mail.gmail.com>
Subject: Re: [linux-next:master 5585/5731] error[E0277]: `*const
 kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, kernel test robot <lkp@intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Mark Brown <broonie@kernel.org>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 14, 2026 at 12:53=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Mar 14, 2026 at 11:30:24AM +0000, Alice Ryhl wrote:
> > On Sat, Mar 14, 2026 at 12:15:30PM +0100, Alice Ryhl wrote:
> > > On Sat, Mar 14, 2026 at 12:13=E2=80=AFPM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Fri, Mar 13, 2026 at 11:39:14PM +0100, Miguel Ojeda wrote:
> > > > > On Fri, Mar 13, 2026 at 10:36=E2=80=AFPM Nathan Chancellor <natha=
n@kernel.org> wrote:
> > > > > >
> > > > > > It looks like this is a conflict between Alice's "rust_binder: =
check ownership
> > > > > > before using vma" [1] (currently in char-misc-linus [2]) and Mi=
ke's
> > > > > > "userfaultfd: introduce vm_uffd_ops" [3] (currently in mm-unsta=
ble [4]),
> > > > > > hence why it was bisected to the -next merge commit.
> > > > >
> > > > > Thanks Nathan, yeah, adding a raw pointer (not function pointer) =
to
> > > > > the struct makes the type `!Sync` in Rust.
> > > > >
> > > > > I assume this is best handled with a patch on top of char-misc-li=
nus.
> > > > > Perhaps creating a wrapper to assert it is `Sync`, since the
> > > > > `BINDER_VM_OPS` contents are unused (so far).
> > > > >
> > > > > Cc'ing more folks related to the commit.
> > > >
> > > > char-misc-linus should get merged into Linus's tree "soon" and then=
 we
> > > > can fix up the mm-unstable change for this.
> > >
> > > I'm working on the fix as we speak. It would be ideal if it went into
> > > char-misc-linus, because the commit that is wrong is mine, not the on=
e
> > > in mm.
> >
> > To clarify, to avoid breaking bisection, the commit needs to land
> > somewhere that is on top of commit 8ef2c15aeae0 ("rust_binder: check
> > ownership before using vma"), and before the mm commit. But I guess
> > there are several options for how to do that other than landing it
> > through char-misc-linus right now.
>
> I've sent off a pull request for the char-misc-linus branch now, and
> after -rc4 is out I'll queue this up on top of that to get merged for
> -rc5 to make this all work out ok.

Friendly ping on this. I don't see this applied yet.

Alice
