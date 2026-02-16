Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2233F23185E
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 08:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771231522; cv=none; b=eqO5LxTanMXMY+n0MltcR9cYFIdeXf5iuPX3WBE4Ab/qxJ6aQTgWSIjZnBPdniD7dXTXHVW9NgxmD1ikLuRS19kA9HkQOQ3iSj9T3tZOJiW0Y9s3Y3y9/+GqCHLR1NVBRP7pu52vsJHq9fxY10UyUSm0B14kxD8347Jui8Vhx8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771231522; c=relaxed/simple;
	bh=OuhvQPJfa2dU+b6ky9kEGtjO7h9w+NBDs0R5fcUWa9U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ag1Cg4K61aOOxa9Y3/pI1BvZS+l5GlBYYZYG4Zpw1WA6ViXLC+RtSg9fD6kLClL4nniaFJu5zJ7/B9DBQ66ZD/TtWlK5ufjAZwc91Z9JLmZ9gcv+3Y+EYOy0Iuqo4rhX99WsF3lvG6DdMKojPAQ9eIzF/FJQEe7ZrPt/ZD/CoJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nrKWUdDU; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nrKWUdDU"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4837246211bso30983855e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 00:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771231519; x=1771836319; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+WW9q6QHOftoZklmKwTwtVIYnoU0bbW26zbJNX1Oa7s=;
        b=nrKWUdDUDtODtP8mzv6xYfThCGK5wrn3VzpeXlkI39NDmzeZDANz65jW9gT7p1auCh
         2vkCD4OLNz+Xprk+KYkWoK1M/EWhERWpeKcAVZGFz1BcuEuGgPSB0VhtrX3RJDIe5oez
         pNH7ulelfJoz3ln6AqS+M7esKjRTjQW9zYOeYEIy4wKVSJA9LPJUEco3zjwRddIpvzZM
         YjqdhHiXMbRrBPgjhC3qGVJjcG3yMRIFlfyoPIEi0JSpFnPvAHl2Wk3+TG4AZ1igyjXr
         k+XKc0aeyN/KaxTYRSNmKFPaKjA8/Gq7wb1ptqAmJdDQiFHgyhSrb7nH1C/T0PqemUnh
         8WMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771231519; x=1771836319;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+WW9q6QHOftoZklmKwTwtVIYnoU0bbW26zbJNX1Oa7s=;
        b=EX+X5dfU5ZW1UBulYQay9+TlQQ55YDK4ni4M2Hl9i25qY8+TsnMlGA5XuC47DcspiL
         IHh/VtvyGEJ+CB1wH56AlNeYKYE8yTCiGjEnxry3R2DOVznYZUqyQBydN2vKQoONGh/F
         aUQbIoCMFUIeUpNWYIPfzmxo741nTdVRJXaQMPrAsrED3kbym54+VPssKPVPk2TSAmn2
         Zh/zmnhbHwxPLGoX25P6yRBcEkX/laOOWt3mPYl70QE5tqAUkhCkZ6WfBHffdApEhybC
         jF/oaA21IVgswvfGFeV41SDXKn5oY+ae/EHuu6vEy9cfPJN31yNYDyjMXD6/IoJdck/m
         +Cnw==
X-Forwarded-Encrypted: i=1; AJvYcCWbl0jN1u+f4ZqbnQGzCjyktdYv7YrYsx8NqC6p6lMxU0KBaYTmbqfmg4CguJM/1s89XoSl5vUmvyDva58orw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwujLT9/4gvxU8OgDJM5k5Mwn/hlPQ3rqri6qg3d8mbNaI61xTN
	1ve3p0T7O9OKbzcpU95laoWOKUt1Z8rd4DccsoqotkuWu97ZTrm1bDdqfuRcR2urc6j537IpbAj
	JQW/ilbt9oRExETIY+A==
X-Received: from wmph40.prod.google.com ([2002:a05:600c:49a8:b0:480:2051:60e1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5299:b0:480:19ed:7efa with SMTP id 5b1f17b1804b1-48373a7a0dfmr128425625e9.36.1771231519316;
 Mon, 16 Feb 2026 00:45:19 -0800 (PST)
Date: Mon, 16 Feb 2026 08:45:18 +0000
In-Reply-To: <20260215-binder-shrink-vec-v3-v5-0-6e5e56d69766@zohomail.in>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260215-binder-shrink-vec-v3-v5-0-6e5e56d69766@zohomail.in>
Message-ID: <aZLZHjAvcoZxbY88@google.com>
Subject: Re: [PATCH v5 0/3] rust: alloc: add KVVec shrinking method
From: Alice Ryhl <aliceryhl@google.com>
To: shivamkalra98@zohomail.in
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Feb 15, 2026 at 02:05:20AM +0530, Shivam Kalra via B4 Relay wrote:
> This series adds a shrink_to() method to KVVec to allow explicit
> capacity reduction for memory reclamation.
> 
> Problem:
> When elements are removed from a KVVec, the allocated capacity is not
> reduced. The underlying C allocators (krealloc/kvrealloc) don't shrink
> memory in-place. This can cause significant memory waste in scenarios
> with variable workloads.

Overall looks good to me!

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

