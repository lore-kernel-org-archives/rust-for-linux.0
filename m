Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A2E313532
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762781697; cv=none; b=bwKlTYlnStsKk8easK8T/83IMfY2kuVDmSZApa/buauKZEfYvcac8Sc9tPsU0OU6rTsZoIdMsUa9eiDd9YT/ZdYH6cG2CHWSW1xWu8G8+OwIF4POoD+RjNsxyXJ/vU3/kJ3YhgrINgIpck+KdA6eLQvnX4NRRDIS2PLtEw2YPtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762781697; c=relaxed/simple;
	bh=hOoHELQJUct+/jjBWDM/iGci2iRQNFOKXIkYMSUGeuo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hjdVR2ykpWrXj1yGXw79fZ+CQKpa87we2Ltd2VkD8qgevDb2JUdVoIcY9F7hhsGO+28xK66K6/6VX/MsUIuIMSElwH1evUN2BDVQFhk0M1zx4bQg8ibW0ODkaYGJBYqavbqjSL1emy8pb9wS0XYmkMYYS93YV9QVqZZRBuJuYAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WlgablEf; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WlgablEf"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4775e00b16fso23386295e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 05:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762781693; x=1763386493; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOoHELQJUct+/jjBWDM/iGci2iRQNFOKXIkYMSUGeuo=;
        b=WlgablEf2ZxZFD/npMLOVEj4uxhJYiLDKZGJG/iBj83rnJ4g16cib1qrr2NHi7KIpD
         kL8Qw7IZemZ/suNsJsqBhO8n7AIVB19rQ7AwpLB9mTZ3R69ToB76lYFKnM50fyxBbyno
         RbsEI/Nqc66EBkpukv87OndMroafuYMybqhjRuSNtbf2uhcoLu44EX1ZU8GNXu7Aj5dW
         JGnbf3OPqPGH9PicuHDLBL81x/BQLV/g803szp0ZZaqgGxe9Bl/kn7sILwf57pDEbJwT
         TXi+Pg/JYqAAqOGEwHo9+4KBBW3L9G3OspQLjQ9INlqvEB5762GlcPXlFdQDdUU46LJf
         EPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762781693; x=1763386493;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hOoHELQJUct+/jjBWDM/iGci2iRQNFOKXIkYMSUGeuo=;
        b=PNI+EkEaMIxopZDnyHO8XO4UAY+K+Yj2deqvDfFjFxvEaW/N5UMpjjBWWbet+M2/cN
         cWebwV0eh/sQv2BnmPR5Hg7VZ6jvWHa0lSe9fueysSzYRIM+lX5BPyMC86GlUKpnttIV
         BhK1QhVXlzERJs6s5c5Kg5QEAeAEpvTJwgc9lWzJM5WRp5sTdTRNzU0c6rIRpjjjBlkO
         Na5AZVCBQkYIxI0+7CQiEHJdtN94mb8XWJzHRAcV8ax/8JfKoiUr3GlCvMB5JYT5Uuad
         NhbjqJCFKxCOc4m6RZQkF9NvChTcrEnBmpYQVOBgfnE5KnH5rZHJCj43GOpDUvv7jLuQ
         +fHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7gsjtsJ/2BLo72/DZRXsqCB+Hb8MmMN89ftD8s3BB71wBezIeDpBIPhQ44tmxJYEWExGy8+bKNLWbVCEGkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpE8jEESCfXv8sWI8FLYh8FWM+W96TA7Kvo0omlK2ESlUHQjg+
	O7piQg9HlVDQO+Q59KQazUAp7ajZtTuN9qUWN+V5PLQK2Tz37XHSt5xn1EmhX686xNS9ufLM5FW
	cLTWw/AFgQ5Rw+M4YAQ==
X-Google-Smtp-Source: AGHT+IEhcd7v1I50vLKbfj11e6ZHlmUaM3O4D8Dzo9IdUzmf1+ToowaPgG4/VPB3oFSYHqCUiGhbSA+XEU/bilA=
X-Received: from wmoo8-n1.prod.google.com ([2002:a05:600d:108:10b0:477:55e7:9973])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1ca0:b0:477:7a63:611f with SMTP id 5b1f17b1804b1-4777a6362e2mr49082565e9.36.1762781693427;
 Mon, 10 Nov 2025 05:34:53 -0800 (PST)
Date: Mon, 10 Nov 2025 13:34:52 +0000
In-Reply-To: <CANiq72mGYKYZmQ8g5AbXCsRS+WPxbeaSyngR69jsEpY8akouog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-10-ojeda@kernel.org>
 <aRHOnGyLx-bEVqcY@google.com> <20251110131049.18e2f5c9@eugeo> <CANiq72mGYKYZmQ8g5AbXCsRS+WPxbeaSyngR69jsEpY8akouog@mail.gmail.com>
Message-ID: <aRHp_MadSjnYwHdy@google.com>
Subject: Re: [PATCH 09/18] rust: proc-macro2: enable support in kbuild
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 02:28:06PM +0100, Miguel Ojeda wrote:
> On Mon, Nov 10, 2025 at 2:10=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote=
:
> >
> > So I think the implementation here is sensible. I believe Miguel's
> > patch is also pretty much replicating the logic in proc-macro2's
> > build.rs.
>=20
> Exactly, I was essentially following what upstream does for stable compil=
ers.
>=20
> (More generally, even if a feature may work, if upstream doesn't
> usually test "older nightlies", then I wonder if we should enable such
> combinations/setups anyway, unless we need them for a particular
> reason).

If these features change the public API exposed by proc-macro2, then it
seems better to always disable it to prevent situations where you
accidentally wrote code that does not work on our minimum rustc version.

(Of course, this is a polyfill and no API is changed, then that's a
different situation and then this LGTM.)

Alice
