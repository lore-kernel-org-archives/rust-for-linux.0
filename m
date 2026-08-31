Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2465D37E5DC
	for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 19:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788205515; cv=pass; b=aC6Dw07HxmZqqwDyNOq0lRJLMhhhI8D++4t4SXRQeCqd/zQVgJWj5acn1/jxF3rvKxCgVwnnbBo64ZUP2/dAguQeTHXsqewRa1q0MsYsyWhKRX8Ys4q7oQcQTov/K3DBs7AgYi3uwdvjkZXUf2qSBxXO10Wkz9iiEzueyrkNgWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788205515; c=relaxed/simple;
	bh=3Jrv9P/AlPMD6Sdxe3mYFdYybT0kcFDapqBsc6G6VY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dtPktJ8gqMLT0v+9F9s5yixcNWm8+a5H2FG2u2GHzGI+336aXe1LnCjOszkIoffiF4XH1KXX9qGM7a+AsGeUkL6PS8cb+0qUaqNBvaFlr2Sz+dfREOE0UE7Frbqkbc0fD9bGQXUIGSTggM3pV90Mf1dwXgNWMcVBAdfKUV0UnHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQ0fnmqw; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQ0fnmqw"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-384422b05b5so326384a91.2
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 12:45:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788205513; cv=none;
        d=google.com; s=arc-20260327;
        b=m5hlJiGyiwoZAkXcD+hVWMWSQC0MuZKE8UdlNy/HO7RjNVCC8lkGCZPD0L1vBJrGD5
         /E6xRXDMDvsi2+Ve229lwQQv/CZvHijUE980MTaBgqq1A65fCGG24hyuBYWdcYn2bTKH
         mq8BSr0lxmxUJVauc/ynjBBGdn1IWQXjIxb8LxX862IG72wmulwn/r6hJu+itifvQKUv
         kKunpvHsLWSzn7FBU2M56JAkeMcfrltJN1vVBm39NzpHHj2JE4/o2bb61A9YlSG5i71p
         1X9kp3AfSs3rcdVjrcJ/Ni1odj/L+klENN8C3Dl7ksLvvqePWIHbR1zlIFVhjLN0KTVe
         GwiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Jrv9P/AlPMD6Sdxe3mYFdYybT0kcFDapqBsc6G6VY0=;
        fh=PGLRNK2REe0D25NOhHEwX59yWoa95zGSq3uUWrypRgc=;
        b=D9V5NmfcwGpUffAGWm2c8KPUJ9//AnxNz8zD8O8+cEQP77UWmO5e2VeklNFfkNo7j7
         r2+NNg+6MSkdA3YxxTLgK1+vu/oCVenbRhKKH3DdfOWZBAlN44a8Ov3fMkhggR55RS9K
         QHKo8m+cgmmDRRzSGGOORBOqZXRyyrXZX1T+JGvfMspfhLkpYfSKzwBqvz0qQdpEWDTf
         n4m/wGMsnb/NtBxBrLnkJXqTr3jtdg6C3GpoWukRIaiewvQGDjACKuUTsNXn4uzxeCqz
         haYThW7H2oW/AvVmBZjEi2286rCiLUmjGDan8oqM7GtkrsYk32yy8WNTXLV+rSH8NMga
         DsIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788205513; x=1788810313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Jrv9P/AlPMD6Sdxe3mYFdYybT0kcFDapqBsc6G6VY0=;
        b=WQ0fnmqwEqXROfU23E1u3Q93KxAXTiyi/cr0TeJg7/mXcGK6G6HMN/hsUdx/MNiz0L
         BuB5RkqagR5+t2PQpsmiWGMRwCiS/i2oLJ1J/avHFhoHHuhWP1L5dVsNp1SPsqL7/i42
         a8oVmZcRK0oQVCFPlmSs8nb8ch1VkpMIqcxUq+sMKvpVG0wYn2P/Rz4YPDesPKYVUc33
         vxDaemah7xH856d6jVVZQtE+PZZxa/OofIiR/SgmShjzIov0HVLqw7Setlohzg6UAFXh
         WZ1PUyaXpPhC0Qktv0xif4c/uw6pYNaE0uCdhyNkx1zaJ9CSVsdRwlmQuH5npUjOL9Yg
         4YTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788205513; x=1788810313;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Jrv9P/AlPMD6Sdxe3mYFdYybT0kcFDapqBsc6G6VY0=;
        b=bTjlogqMtftl0ohKBtvbu3Nj5fYmjc/wYTvMUjlaJxIekrcZFAp9C8fyukSL7w9UFJ
         FjlHXaCTTsMaC3wVcidb1NsbGop3nSeFSlstoZr6hNlFS/dTms52pXsx6itPro//puDQ
         QJi+cmBjOPH/gpUMcXC9Z9VoYXzlddrIz5A7/2adTCOyDv4jSosqJbULeZWkgd39kfcY
         w2wWwtrF/wyXyaHWaK4vfYGbNFbGfXT786dNtsq2h5XgC5o8DBYHKATkytIN6dsKshY7
         OVJhWEexIrDxXh5T6qdon41jVEj0/tKiVfMKkLt/famEdqeHs4WFBV/0Ql0/VHyhZTRV
         uILw==
X-Forwarded-Encrypted: i=1; AKwUvBy70S5pr6of461NYRhPo9NUVlgcNkE5xGRr8OMTiyOvueJXq6JxsWlrgfDG19z+/Dk15SBRofmgZRVHJqjuYA==@vger.kernel.org
X-Gm-Message-State: AFuF++kksCL4HopEoUsWRyHHHgQl+s5S5YOJHcMp7Ddhq1UmrTK9mYnB
	zLdfw/6I3o7Fiyji+srn/CJDEe5hXinD+SA9wuB94EBNLvLzSBi7ad979grvlQgIYGfMDbMH/WS
	NBFWwzIgm3mNoNmoAjhMGgrDgDQSpzSk=
X-Gm-Gg: AYBFou2xoFNbFSWvq8smQGLgvqC37iyBe88E2LqY2ucY8kbhzkzkeiqnWy1crJRexhC
	NXes/Cli5PdzTWQjR4L2d9OQUNJa8UDCkhK5JNdcr6IfpNDAZZS0iCRUfCoqTJeeE1qNKKnXAvf
	1kcNTpzE9abkm1BLN8IDXw/exwaBbZWynfA/3wIZPDNKaYNoPtoaW2oObN8XRm+xJuBz2CuR54y
	g1wNQ4T98L0m1YrIjIXw4UZ7JT98CtbdShHE90l/tdmT6y2ANFHlc+gz2dzHdX8K5N7h0sHhbwb
	xEcPR6DACC5EDETnqyGReKehQdkTErMTVZ/KFGTF4LP5HQ2w/cLNX8cxZ1WM/pmVed0Xxu+HgXn
	7xhXssyGPmptX+oJWhiLSvavq3f2HRFfv1sofbzPubhRasS07mNPL4ek2Qyn+
X-Received: by 2002:a17:90b:17cd:b0:390:af7c:fe5e with SMTP id
 98e67ed59e1d1-398bab29b39mr13817320a91.2.1788205513452; Mon, 31 Aug 2026
 12:45:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828122444.475-1-nils.lehnen@proton.me>
In-Reply-To: <20260828122444.475-1-nils.lehnen@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 31 Aug 2026 21:45:00 +0200
X-Gm-Features: AcwNN1UrGd_bZLkMVyH1G38N0kEIKnS8OgGaNrIu6lFxBJ9qf_B_KFzk1Mhm8lI
Message-ID: <CANiq72kzouWAJbbhpKQXYit=VnF-9z=iLspk6mgSQU6m4-Us5g@mail.gmail.com>
Subject: Re: [PATCH] rust: of: replace `core::mem::zeroed` with `pin_init::zeroed`
To: Nils Lehnen <nils.lehnen@proton.me>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>, 
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur Ozkan <work@onurozkan.dev>, 
	Moritz Zielke <moritz.zielke@gmail.com>, devicetree@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 2:25=E2=80=AFPM Nils Lehnen <nils.lehnen@proton.me>=
 wrote:
>
> Resend of Benno's patch from the Zeroable series [1], as the issue [2]
> asks; same shape as the security.rs resend Miguel confirmed today [3].
> Rebased onto rust-next: one context conflict from the
> `as_bytes_with_nul` -> `to_bytes_with_nul` rename, resolved keeping the
> current name; the change itself is Benno's, unmodified. An incremental
> defconfig build with CONFIG_RUST=3Dy passes, so `pin_init::zeroed()` is
> fine in the `const fn` context.

Looks fine, thanks!

Rob, Saravana: it would be nice to get this done, please let me know
if you prefer me to pick it up. Thanks!

Cheers,
Miguel
