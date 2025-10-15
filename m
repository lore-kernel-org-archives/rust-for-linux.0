Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252E030FC16
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 19:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556722; cv=none; b=fCYggRhtwa71e//OthlNC37IfITPX1oSP2PzwGICp1aWo1Q9mSQ8nnLrdvEl2NH7KVkYqEn7Q6/OXU+pRuig9KoAmPH9QXqUikO6p5QkMf0EAtdSL8OVjQh2HmZU4N1WDNG8Qvr3Nwcs3bu2p6gC8HyCBNVQh8DOa5HStRIMqmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556722; c=relaxed/simple;
	bh=vFQ57qEPFFK4a1P47Xt/5YF6jxl+QY81g9//5V0r9E0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jpIUO6pkLLxD5FdeWU5TSHwYtdrFCg3KmMOauh4SdG5pezoJMUgtg1q8lm9li8t5WdztAHPy6xWoBz7KBroVgtx8FVfP6ss3YMD3resIqPfjSvqyDOeX4w9mABhbYSlEkziDL6qE6c/s6iW8wBmwBkJQPTTVxaWvmGiCjJvc9AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BGZH6309; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BGZH6309"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4710055d00bso6302355e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 12:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760556718; x=1761161518; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/gjm1LijoOvaR4UmxrMCJ1ivWAHmFdej62IpC3mzcB4=;
        b=BGZH6309bU6Mbs+3J4LnwjlKP1TsCRa6yES/tI0VhKD0BHpaB3l9FbZn/UiCGA6H0t
         yMSuoidfrDnDN03lgz3vU6xT41uflImWK255l4gKelA07Z81mnhd4wQ+ZyiyXwtJ7gvm
         K3CDcCMmL9Tb415htIo0hUQAfWC1u+bFWq5gvcAjMylvCPyIYKJoMuYJTq+gIWc1oEqM
         sjg1Z0NuJEH7E88Dagc06vJhQJ7QpPtiNJjX1UCfwV774xHHQBCFOJIARrw4s/RYMrTc
         aYh8x0Oh4eZuINjdmnyD+/PRkjVu004xGouOsPRGvh3VI68Rt6uo/QIK9y8emDK8CUky
         mB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556718; x=1761161518;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/gjm1LijoOvaR4UmxrMCJ1ivWAHmFdej62IpC3mzcB4=;
        b=uSPhFvnozDSrX7goOuuaaWF9WTwrbzEZPQ+952GTJHkLrgmAiYE4Tfek0PNXvi5LqV
         Z4xWV2i3BEUn7qYVNmykBIdTwtxUQY0BK1M3/ApRq0VWonRu1ipcVG4vo1uFvAD0QWmK
         aqs6lBBIM64w6BqiX8ud7JA8OGAigYUkTPxc4ES+9hVq+8htBpQXAsdNUPOqDTCowafH
         kMVOEUBJX3Z77SSP2+AVMxGFY20jitF7QjZNsFBZGWY/JccMWrCVoQg1kcC8jF2s6A4F
         IYQBJSwx83ZHXePEyHWudAQvTXPWGkQncX0EDcPOmeQj+AzxqkBprZJCxH8eHw9hxXoP
         fpKg==
X-Forwarded-Encrypted: i=1; AJvYcCUaWRL1yB5aT5ST++/Tg/oUaDFDTFcS9s5g7OWzd76Hy+D/JULEOzcKxbyRVO0qWpG0ujqRbg72WCeyjToMeg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz0vVgszJ/zqUSqZKqX7RI1IfPm7IMCWl2D1Dj4MMiVmy3rcWT
	YhO4ZVd/S4ok8pfRGCjyxsTNGipBEdNm9io4HNROXJRo6qmVCzzImpSSx11SsSPNVvEVwGsItsE
	4O7i/CRBRQdOJ5LHQEw==
X-Google-Smtp-Source: AGHT+IEL/VHOLFHuIoVUiV/D6Bqe6tW62TJ5aBz6rcqOw3p0/Xw8HWgUhNCxtEkFwsrO9XapAOq1uGfyLXGMMfk=
X-Received: from wmbd3.prod.google.com ([2002:a05:600c:58c3:b0:46f:aa50:d6ff])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:138a:b0:46d:7fa2:7579 with SMTP id 5b1f17b1804b1-46fa9a96521mr194128565e9.9.1760556718448;
 Wed, 15 Oct 2025 12:31:58 -0700 (PDT)
Date: Wed, 15 Oct 2025 19:31:57 +0000
In-Reply-To: <20251015-cstr-core-v17-6-dc5e7aec870d@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251015-cstr-core-v17-0-dc5e7aec870d@gmail.com> <20251015-cstr-core-v17-6-dc5e7aec870d@gmail.com>
Message-ID: <aO_2rb29XrSn0qo3@google.com>
Subject: Re: [PATCH v17 06/11] rust: alloc: use `kernel::fmt`
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Russ Weight <russ.weight@linux.dev>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Oct 15, 2025 at 03:24:36PM -0400, Tamir Duberstein wrote:
> Reduce coupling to implementation details of the formatting machinery by
> avoiding direct use for `core`'s formatting traits and macros.
> 
> This backslid in commit 9def0d0a2a1c ("rust: alloc: add
> Vec::push_within_capacity").
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

