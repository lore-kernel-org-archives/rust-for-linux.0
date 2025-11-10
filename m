Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB99305E1D
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 10:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770268; cv=none; b=d+gBIzItOKAcTUsMkhKknsUblOm52QnQaXU6j+bWupQxDzd3BU3bCRtWe7CftXctHoXgfORkcMQh9hljLTPvnFdA2s4Ohh+JkMHCDdXARZj5SuWOKZuK94vtxPcbTYRT+UQG76DqzzstUcbzICFK2js0Dk9B1kMV0hGQgMrhTdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770268; c=relaxed/simple;
	bh=aE0cpumrRJ1UXIBWA3mSkc4AapKLk4WpELDVIiqYqrI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U79iIPjqivrEVSjDujQGUwM7JMNvruk/zu18acAfhA7Cmpr7lQc5i5Nh+y1YuuLM1LYgFFFOnQAvM3GJabDHpsg6H1FyBkoUKXoTsMoG57N0Y3PhM0ON5cYtKkrGIm6tRqfmyU5jTaJmn7yHBppo80J32fxmne08ffQpECfWoiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WIaQYpF2; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WIaQYpF2"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b6d40007ea1so221957766b.3
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 02:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762770263; x=1763375063; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nNv22iO458s//Cdaagcdl8KtQQ9ntxwjUMQVBshAGaQ=;
        b=WIaQYpF2dJNWtsu1TA3IOGY0VHBfiS881WUK21fcyqYc48yF2Wz9NmOpe9MEgepAK4
         cbS1bXKaucri7bpfwffweucNmTdUB17uwgffv/KCukmslQuq9dlqSSrMO957WB6LPhsQ
         FvZxqEfJS5jaellc9jpoet5LRpk4diF2nxg4dKa73KSigs990xKJ3LTP5JsbtxtYLFsJ
         jxzpcdXxnXvdevxmtGMTvG9ykc0mUSZubndUgxvS/8I8IvTPYfHINL+zwJnPupw2bs0W
         liXwmy+sUPizVlqnMoaDwxwlJx0hsamLNGvAHAV8g7hR3le6GkyD2NNQzlXEYZWAjXa2
         V/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770263; x=1763375063;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nNv22iO458s//Cdaagcdl8KtQQ9ntxwjUMQVBshAGaQ=;
        b=WrgxoNERUnQRc5oNgmN4Euzh6KqvGX0cdveEV94aCnfRRZ4rIA0COQ+tPr00jZl8sJ
         KFZ2rlGB+0XDl8/wixaSKy1puGtVsMk0yarABdoGyQtNVr8TwDzSU+vU8Dm/y40Kjr+H
         G3jz4KUQoojd5nSUTZ7Pul6MqziJpi6VkiGkcUJSf7W0q/WV8i8loyyQsPCk1tELEeSg
         9BSMkZcTZ1zgSKv30LzCXcQTwFNnaShJcEt6pBj5JqVMNDEW1eSO6XW5JhLJXMdb7ZMc
         wFIzRL81U0gX0xykQ8yTOTEG5dB4Dzjl1N4KYtIINL26CWUiEnyVQzZh1CMjjO7rHKUI
         g8Og==
X-Forwarded-Encrypted: i=1; AJvYcCVfMaJvV74ryKSX9sxPx+R9WIXpsCLQj63YQ3AzrvM4dh0lf6zD9U1Yc8q48MRfHbPsCCbqGdycthwLYzPgxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkyGrygZaTJY00BxR8pxHPxGSFU2XoqJCY2SklMAqrpYYBVzMf
	kONgMAgXEE2sBxeZwlL/ApXcxaPW8A/xHdRRPF9UtAU2vsvIftVJsAP4PLKGHaAn6tVjtMUb7AJ
	cDVHI7gqsZ5QzzYyFsg==
X-Google-Smtp-Source: AGHT+IHF1mfHQnJtzIm6KGV9avfylPLNTU2wZn2/rVrhlMwC4+Dos2C8BVWng0M+4Mg0oVxmMCdjIYjJS7RxIbY=
X-Received: from ejcvi8.prod.google.com ([2002:a17:907:d408:b0:b72:41e4:754b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7f26:b0:b40:da21:bf38 with SMTP id a640c23a62f3a-b72e041276dmr757987266b.36.1762770262892;
 Mon, 10 Nov 2025 02:24:22 -0800 (PST)
Date: Mon, 10 Nov 2025 10:24:22 +0000
In-Reply-To: <20251110095025.1475896-2-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-2-ojeda@kernel.org>
Message-ID: <aRG9VjsaCjsvAwUn@google.com>
Subject: Re: [PATCH 01/18] rust: condvar: avoid `pub` in example
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Mon, Nov 10, 2025 at 10:50:06AM +0100, Miguel Ojeda wrote:
> The future move of pin-init to `syn` uncovers the following unreachable
> public item in an example:
> 
>     error: unreachable `pub` item
>          --> rust/doctests_kernel_generated.rs:14683:1
>           |
>     14683 | pub struct Example {
>           | ---^^^^^^^^^^^^^^^
>           | |
>           | help: consider restricting its visibility: `pub(crate)`
>           |
>           = help: or consider exporting it for use by other crates
>           = note: `-D unreachable-pub` implied by `-D warnings`
>           = help: to override `-D warnings` add `#[allow(unreachable_pub)]`
> 
> There is no real downside of keeping the example as-is until the
> `syn`-based pin-init is introduced, so there is no need to treat it as
> a fix nor to backport it. However, we still need to change it before
> introducing the new pin-init.
> 
> Thus do so.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

The unreachable_pub warning normally does not trigger for documentation
tests since using `pub` in documentation tests is not wrong. So this
sounds like a bug in our doc-test setup.

Regardless, I don't mind changing it here for now.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
