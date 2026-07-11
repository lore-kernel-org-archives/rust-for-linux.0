Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F3332E757
	for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 10:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783766249; cv=none; b=G4cmjmqa40oeykSfTfOGr0LY0BpKjnC3CwT6uCjEjPpZrzLQ3EWAj7cCNMfXeH9GSxEiwMLKdR+Nc4i1LcOsp7IZEJ2eopDNketdOG3lNAvIUNANLDNdCgflZbmVEAcM0cMVOCNIx6LNhUyEnHOdDcTThMms+Gxl3GIFptHopAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783766249; c=relaxed/simple;
	bh=ESLxc1HKNz4yV7ALmx9qcJmM8GSWlhFfKuxx+FL1Gc8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fL7OMmFtWZ6K7yHYA0edbu3v96267ficq4fammxS8EBwK13BK1e8MAW/FYIn/C3JTXRsqoGspuXGIfUKVBwRPSjCa0pm14LXjjJ8ekQes0eZ6ELL7sCNm0SRwVLsPHNtcgukZAJDOSQOuFWPekVsDLZGe591taHIUG1gfNl+qhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iDe3ONEQ; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iDe3ONEQ"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-69c20d1d150so1637338a12.0
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 03:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783766246; x=1784371046; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xqnaoUdX2pbKNnqmvPQbVAVYTN3MsRyGvFlrV0MhNMA=;
        b=iDe3ONEQ2H+4OG7IbPLNdwWZ+8P8JIDDi/jTSUwyKNP0t0/5mTdiAp7WCIPFnOxRvq
         mIPWHuc63xWf9MT8av1DLICWTm0OKzlSoL3urEWEoJAA9CyNFsIpuyXSdejwz6xXZjB3
         q0+LWPb1jasNxVzX4a/5OxJqgAe4wOXE8N/jrDKpbVObQr7/xVWtPYPSJmNQVPt3Fzg8
         VE+Fa93BogghNOQ46HDXYjrKK8BZOzzH/eRQ7g5w0wWlgJnFUEUUqK5tiNaSSLKiiMns
         UiCnuA+jL3bnAX80Zp5RZmJKPvZtHk4uf9qgyDb7qn2U90yqTrR8qyHO6pmCFAdpnaO9
         yN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783766246; x=1784371046;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xqnaoUdX2pbKNnqmvPQbVAVYTN3MsRyGvFlrV0MhNMA=;
        b=Hm0vACqX1ElXofreme6vkVvH5f4uqZFzolsdtKjYInbrRXK+D7Ro5RHstWFsFEXdhF
         s6bgBq6MiDhYsA6Zm3MFdZPAvP2o5AWpCZi4If4KcIvP858rOHkEOpuqSJoKLCffSszK
         xj+8jrgQlV4X/BCdKxqMJxgDKda1O9k4gXCIlmgi2HkDTWhaJ9ynYwWmW2NpafrnN37r
         f+vqJUKnUbRWAVVRUOe8lmKIjnSfBIZ1aY6n9zhNpybO4A2Grc/cwi5pAsbPWx95Bojs
         0MONyIiWMMlpYGXyIztqTO3lTfQWGwU8mberioIvhuG7xCv8ar7pgzMLtfkJLtmbpvv7
         5BOQ==
X-Forwarded-Encrypted: i=1; AHgh+RpofKTplHqatIhN99R0rjhjJoX/8vnRKKTxLXsDqKTreCLP9e0Zy+YAOlrhw56/BL2qmougKI4c7X22lq6nYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJyy/+Z5g9wfpGM0jykL+dwHlHzjN+Y5++kzvNBTibS4dmyz/5
	HPN2yln7pLooCaPl0z5niAU3BEFVflaS4pMfHmnEmuMXpwhffnd20p5I//bZeNnhGt5Ol/+lNl7
	xo7aclwH6blyr6JNv2w==
X-Received: from edaa2.prod.google.com ([2002:a05:6402:24c2:b0:69c:20d9:b154])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:51cb:b0:699:39c5:204b with SMTP id 4fb4d7f45d1cf-69c5f0be27dmr1056069a12.18.1783766246370;
 Sat, 11 Jul 2026 03:37:26 -0700 (PDT)
Date: Sat, 11 Jul 2026 10:37:25 +0000
In-Reply-To: <20260625231919.692444-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260625231919.692444-1-ojeda@kernel.org>
Message-ID: <alIc5f-NpbnDr_Ml@google.com>
Subject: Re: [PATCH] rust: zerocopy: update to v0.8.52
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Tamir Duberstein <tamird@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	Jesung Yang <y.j3ms.n@gmail.com>, linux-kbuild@vger.kernel.org, 
	Joshua Liebow-Feeser <joshlf@google.com>, Jack Wrenn <jswrenn@google.com>
Content-Type: text/plain; charset="utf-8"

On Fri, Jun 26, 2026 at 01:19:19AM +0200, Miguel Ojeda wrote:
> Update our vendored copy of `zerocopy` (and `zerocopy-derive`) to v0.8.52.
> 
> Most SPDX identifiers have been added upstream at our request [1]
> (without parentheses -- supporting them is an issue on the kernel side,
> but it does already reduce our differences). The CSS one for `rustdoc`
> was added too [2], but will be picked up in a later version.
> 
> For `zerocopy`, enable `--cfg no_fp_fmt_parse`, which was added at our
> request to avoid our local workaround [3]. This means one less difference,
> thus indicate so in our `README.md`.
> 
> For `zerocopy-derive`, enable `--cfg zerocopy_unstable_linux`. This
> allows us to use `#[derive(zerocopy_derive::most_traits)]`, a new feature
> upstream added for us [4]. We noticed a minor doc render bug [5], which
> will be fixed for a future version too.
> 
> The following script may be used to check for the remaining differences:
> 
>     for path in $(cd rust/zerocopy-derive/ && find . -type f ! -name README.md); do
>         curl --silent --show-error --location \
>             https://github.com/google/zerocopy/raw/v0.8.52/zerocopy/zerocopy-derive/src/$path |
>             git diff --no-index - rust/zerocopy-derive/$path &&
>             echo $path: OK
>     done
> 
>     for path in $(cd rust/zerocopy/ && find . -type f ! -name README.md); do
>         curl --silent --show-error --location \
>             https://github.com/google/zerocopy/raw/v0.8.52/zerocopy/$path |
>             git diff --no-index - rust/zerocopy/$path &&
>             echo $path: OK
>     done
> 
> Cc: Joshua Liebow-Feeser <joshlf@google.com>
> Cc: Jack Wrenn <jswrenn@google.com>
> Link: https://github.com/google/zerocopy/issues/3428 [1]
> Link: https://github.com/google/zerocopy/issues/3457 [2]
> Link: https://github.com/google/zerocopy/issues/3426 [3]
> Link: https://github.com/google/zerocopy/pull/3416 [4]
> Link: https://github.com/google/zerocopy/issues/3466 [5]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
