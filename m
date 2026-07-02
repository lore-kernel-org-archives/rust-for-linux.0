Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D74948C8D5
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Jul 2026 10:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782986401; cv=none; b=PQo7AB6xjeKfQG6gYNUlgv8txo77jP8ZD8hc6dy6N73CDjXxv7kAzz31Mztw53btYh35eTT+UhSU5/vudRFYv/p/OWXmdxwWDllOOCSq39o77a+6ojlqrrgEWTO0bUwN2p2qT5e6Jb/6PME1H6ZiD8ziVOLOlKpNXU68oscZpbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782986401; c=relaxed/simple;
	bh=BSA2WdyfbLCUhzNNGPs5/C9IUi3QFF+5MumSiBfzJ4o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bdK4oZz3P/Na1UO+hC9w65RvpUti7RQR4nfNAOypxAwljEfH1Blyf/fHDLXOHTGa+QQDSE3bruojbpfQCa4cDBMPSiXdSLmkVrabqa6LMM7oamVfE2CnoflBiojGUivHL3sYYCTaY0lliW2hek81pes11nDZ/c6fFQ3rulkPd5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bp3tD5YC; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bp3tD5YC"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-4767036f8faso1085133f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 03:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782986399; x=1783591199; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6uEKCYanCW33pB2ww8Id6q0Z68mqRCxROZRE1/7Rx8I=;
        b=bp3tD5YCU7waRP3TtvF+VA97Urfc6POFcUWkk3e+V9bF85nbcrOZQj0tnhwgOd3jGe
         0ys7OvurJ1Kn9chjGr/eC8BBaslKoGl0H4ZemIr6Km5L9FSr3WzsX5PDWbwb+KKXRMc/
         66mMN3TRYiU+645SOIBtYA7A39AvzmeAGDsObup13hFl6E4GMuyf1Vjdle0cnX9hxbXO
         DJhLVUaHLCQ6FXPRt8+0VObv3p7D3sYcolkYOE07RC0H9JDLLALiwYKNeM3J/2k3o8Xb
         lllz3kGE3FEuVa5QG7PBM9E46r3XsNuzolYMr7an2jb/XuYsn8CG27XA9EIu3GWmRL8+
         5XUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782986399; x=1783591199;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6uEKCYanCW33pB2ww8Id6q0Z68mqRCxROZRE1/7Rx8I=;
        b=RkoXApORHLf8eh5ihxCCH7kuFcu8WgB9aELh+KEtn1G7PzN2lqFrJte9rzinSGaa3m
         GVlwDhbIHB3V69aeRiwh7yPLK5UztDiNA2BVaWCKWnCcVs0yqnwuK7c8B1yUibWzg7Me
         aR7QwvWyBCfphqF0+IrZFC2h36dAFpHKcgbfubTuss5a23tqr9+hqc3b6AwZPRP5aDfp
         aTUrKHEVg9hV61U5v8LfGXNrqZISD1hnQLXpBXirH5Eo/PrfFdEhHd2oNnbWpVwe/VW9
         aeQzA7QiFZeTbIsOVdqBKVdO0tbRYLZYalM8JQTuj3Th4yyFmA2QNV2K/nb8TsN0G0Ev
         hkNQ==
X-Forwarded-Encrypted: i=1; AHgh+RpzmV6BCXhywP918moaDuXWDKgQH4NLeYqMNTnBvBLCaMHDDlrx/zOsaWiSJIk8OQE+CV5RrhraT0+LiTyfeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVEAKoyFYMs7TRRa9bc67WYxemBhvPGuJbfXSjh1o62Fd3V65t
	uC0hbDyCc1RPNGQfMVm/z+w8GSY03PV5ToSrDllvdhgETNrbA1ITa4gntyvtCkhCTcjw5MGNMpO
	iq6P1sqObdw77HjlNAg==
X-Received: from wrvq16.prod.google.com ([2002:a5d:61d0:0:b0:478:d483:f095])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5d82:0:b0:46f:7d90:8125 with SMTP id ffacd0b85a97d-477578976c3mr8573530f8f.15.1782986398482;
 Thu, 02 Jul 2026 02:59:58 -0700 (PDT)
Date: Thu, 2 Jul 2026 09:59:57 +0000
In-Reply-To: <20260625103957.730-1-iganschel@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260621210134.441-1-iganschel@gmail.com> <20260625103957.730-1-iganschel@gmail.com>
Message-ID: <akY2nUSifg4IbuGL@google.com>
Subject: Re: [PATCH v3] rust_binder: reject context manager self-transaction
From: Alice Ryhl <aliceryhl@google.com>
To: Keshav Verma <iganschel@gmail.com>
Cc: Carlos Llamas <cmllamas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Jun 25, 2026 at 04:09:57PM +0530, Keshav Verma wrote:
> Rust binder resolved handle 0 to the context manager node, but it does not
> reject the case where the caller owns the same node.
> 
> The C binder driver rejects transactions from the context-manager process
> to handle 0 after resolving the target node. Match that behavior in Rust
> Binder by rejecting handle 0 transactions when the resolved context-manager
> node is owned by the calling process.
> 
> This applies to both synchronous and oneway transactions because both paths
> resolve the target through Process::get_transaction_node().
> 
> Cc: stable@kernel.org
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Signed-off-by: Keshav Verma <iganschel@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

