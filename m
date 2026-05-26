Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0B8352C34
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 12:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779798794; cv=none; b=R6GY4sMm0fnWbQ8Rm+OQ4DpsW34AsSOVW1Yuz0qbCPSUs6TBzYgHYEH8MOORIK3dZIvp5TJUSqNzHlAtzYRd9MIEoU2g/gBCAQDY4drGr56sjTx7Wg5UNHQ2+6QRTK+YYqu809DXLf54GKYBFd4I0YcEmY6ywAFHOJdJRqC8+PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779798794; c=relaxed/simple;
	bh=4YRYfyPsNEGCbKUd20ybf1IQTRyrgKJkNlQD02p9ZFQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nokbdCG+AhgFIJrdW5cRGYBcznJY313uXl0OnEtwfPzZOK9cw2eSLPqvG0OgcIrNZP5k8Ngp1FrRVJuXqwwVW3sbJMJSudkFVnKZ9C7wkQP1gCSVp/3eeWitSIxZm7Iu3OjsYmXm/dJKT0SJ9oFNs+1F5RY8K9jCVwpDtwD/qJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X7s7Tc15; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X7s7Tc15"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-49058e91639so20947925e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 05:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779798791; x=1780403591; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jz9nqBUzgSAfLAIlST3XLdZAB8Og+achonVW5GPAbVI=;
        b=X7s7Tc15KNmwVVmkHUIQnRCq38GIEzQkw00nrDqFGVCzCaYuPBKUCurLJtcvnKh6Fb
         zmxmEC4sqHQQbKbB/P5PKi5yYb7b0LcXZn4OHgonGlJ3PSRtYWLiZF8sVJp87TJWoYaU
         421qSLJn1cSPDLKwxMBAeHTXfX1DR68hGSx2LjlwitSyk+YNQQJnF5f4VUsw3es2IMcB
         qcWglhAYkb0yAiw9uv4Y61iGcL9sYNbgZbI+NcXbw+a12+MMK/R+ImMCP+O6vzoM8tpe
         cQNCSyEVBDW31PdOQDY+/rLYJTbiXxo+pZ/3b8eyTF9VkLO3TsLCS4O9+h26XrV0hPYE
         WKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779798791; x=1780403591;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jz9nqBUzgSAfLAIlST3XLdZAB8Og+achonVW5GPAbVI=;
        b=rKwi4JaJFrCB02ixSWsio8a0j+OsBfx6Za4iiAMirbbwsDbDkCD3S5lnEP1DdlYzD2
         4qSteMoaql2oHMBa5K1l03cxtN1uVMbmWxpjDMyqag4btieFgfUTwRTDraFzDzVsYbgl
         9+PZod8O/morpnXXdB2xYCSZaYNRReCdO3uA8i5UC16sTD4mVSu0qI7NbIv6BbnsMItF
         rejXVAHzgzVlYLkrL/pyRqkOZB1vTimh2psLLGuZZ+ejSm1XYbgxiyfsmB309V24PIu7
         ipc7bRC0m7W0/GyXN4P3w6gJjlikliJRFi6mNnT8MCQ7i/LTOhdPRNKQupjBT8BOb3LR
         +6uw==
X-Forwarded-Encrypted: i=1; AFNElJ9wLqlPXPkRgp4KwwrpaoaHyRadCyp1ge0iuKrlDWxIYhd4JsK0DRGfP7fY8s8rmaKl1IgHhjqXjXpIEvXH/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjMPxL+wGYrfY9Bug4WRhzx69LIfG7it49r2EZHgUP8JkD+r8/
	7W9FsftSzImmrx2vfQefqXQ2DbqaX5pBTVr7gKIU2Q8Ml30hecE/M+dJ8wgcsJ5MwhBzPDcvuco
	LoKuvJ+ixIPwdEmgxpw==
X-Received: from wmoi15.prod.google.com ([2002:a05:600c:480f:b0:48a:54ff:28c8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:644d:20b0:490:3cb4:f1b3 with SMTP id 5b1f17b1804b1-490426c5a3dmr221232685e9.16.1779798790615;
 Tue, 26 May 2026 05:33:10 -0700 (PDT)
Date: Tue, 26 May 2026 12:33:09 +0000
In-Reply-To: <20260522-binder-strict-provenance-v1-2-3d6e9406e864@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org> <20260522-binder-strict-provenance-v1-2-3d6e9406e864@kernel.org>
Message-ID: <ahWTBbLpYEDlPTr2@google.com>
Subject: Re: [PATCH 2/6] rust: binder: transmute transaction data
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, May 22, 2026 at 07:12:47PM +0200, Tamir Duberstein wrote:
> `BinderTransactionData` is a transparent wrapper around
> `binder_transaction_data`. Use a transmute to view the transaction data in
> `BinderTransactionDataSecctx` through that wrapper, matching the safety
> argument at the conversion site and avoiding the raw pointer round trip.
> 
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

I think it is an anti-pattern to transmute references. Please keep the
raw pointer cast.

Alice
