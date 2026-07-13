Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF893A6B9A
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jul 2026 08:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930635; cv=none; b=KY7GqRb//W5xbUHyL6po5WiS9mB69KBVqplmWhrmSPcZDGtVweMIY3kwxucp5ONcZS7bOx2TUUH6wsOcIwdXMSz8r/6MlkpX8aVNj0n3PJZI+KN2EDl5omuuC5GPrKXVc+PP1i0BSjfoxUQmirmHDYh4T7A/uykjNFm48ODQsRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930635; c=relaxed/simple;
	bh=e7biIQWq4ayHoPrEIMSf8dlPvUrUBRV5RYriupriJE0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=loAZ53sOChVVuD1uSB59qEt1ENU+3YntEAe33XLwz6qNASYbY9OQrdbN4s2NhD5G+IZueNMKTBLytYlN5CbNTM1sSraAuTtS5/cT2WX/cHAzjaEvwEYq3/CKaSWGHYxPvYxKMO0kn+qgqXDr6SG/H/MiVwVORah/8Wm+4u6hby4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qjjq3s+R; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qjjq3s+R"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-493bfc3b84aso12924585e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Jul 2026 01:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783930631; x=1784535431; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e7biIQWq4ayHoPrEIMSf8dlPvUrUBRV5RYriupriJE0=;
        b=qjjq3s+RFS6qbO3JTGK72AL/nlAHYi9B8SqBHxXSiIgAA3LpsbTlUTI2JWT6EIW/IB
         FPxIakPznrCdq6XUTIfcG6TfRy6p7fO6l0+N9WScJeZU70/PL84ZtaYm+iO0mcvUqcB+
         07oW4syGW2NIi7eU7rRWgl0zX+K6UFY/GwLqHFUoiRf7lgykyqIj0U7LiE1Gs+vClPlT
         hYpSmVGiHocqOqNtpZGdaCLccVT/QtEEOyhx8C9RdM2n72ERl3cw8WIh4eRVPN6dbFQD
         MyotRj1p2UUJAzRRbBwhPrnOn4PU8YfF63oOV41qRvIo7VrFLgqMWu5MRo5r8dzN4vtB
         sc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930631; x=1784535431;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e7biIQWq4ayHoPrEIMSf8dlPvUrUBRV5RYriupriJE0=;
        b=bqhBcXHXOTJP7F4tlXh3iBGZMC0rSbQT82qRvxjCRlzGIG/4YFDMkJu5QyqR3UqkJl
         9+PkMpY7aV+eZkfrDb+g+nUU1TYJ/1gIHx9eLooW2+zjvrMgust4GZQO4c/S5yAbI+oD
         R4a41p+ZzZKtntibpEIuUjZGyROKIi8q/dCoaaWM8sXCq41PbaJCuRtxWI+u7SjHDqQa
         ylFibrkGqirZDbNWE75duUplNCck0t1z1Hltaa5a/WzkOMFHXsFtEche+NdWjIllnuzv
         EuFjhgkJSKSGleW/w5zbyniv7RkpB8kITN/qY7i0NDcSzpkqD/R93Yl+MBgya1ttHB7k
         qUMw==
X-Forwarded-Encrypted: i=1; AHgh+RpzDUQk/Qolc2CV4Qn7nMtQ2A9TYD7QxP/up6oMd7h9Lf8nqqsBaGLB93MYvJhxI4QlyZvyND2M12S70d6crQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVzLOOmiGA5E0CzErlrC0vji+IwQ1JHf0K/pGFFmx+oEmOU4hh
	AwQqXkV09pNWVxUf/I1VG6fBLy8F1nkVoau5OiTyZE94i/j5pawj9xbZcZ11Lt4TScMuApVv+tD
	wxv0serSknWZPdQOVPA==
X-Received: from wmpu18.prod.google.com ([2002:a05:600c:4d12:b0:493:f522:9fbe])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f91:b0:493:72d3:4a81 with SMTP id 5b1f17b1804b1-493f87e5bd2mr75050475e9.16.1783930630723;
 Mon, 13 Jul 2026 01:17:10 -0700 (PDT)
Date: Mon, 13 Jul 2026 08:17:09 +0000
In-Reply-To: <20260713-fix-fops-owner-v8-0-2495cfa82d47@linux.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260713-fix-fops-owner-v8-0-2495cfa82d47@linux.dev>
Message-ID: <alSfBXoFjX-W_Ch1@google.com>
Subject: Re: [PATCH v8 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Jul 13, 2026 at 02:45:21PM +0800, Alvin Sun wrote:
> During tyr debugfs development, a kernel NULL pointer dereference was
> encountered after `rmmod tyr` while gnome-shell still held /dev/card1 open:

I left a few minor comments, but otherwise LGTM.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
