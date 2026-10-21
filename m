Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572782;
	b=hHxKooAQmj3f7oP3IanmyzP+WwxGIy3RwdC6HUUx6qh7fHEjeY5658mUxrk7qEKEU2ng
	 SD1WhHi6FY4Bi4rsjkDhZaeAQwATFrPyV48tXdqgS/+95/LA8toEY+vzENlWe/G47hUzu
	 McCL6zjHCyqbR6nfHPJuD7tbtiiolIqZ3458XVEz4Ny4Pvyz0Tnv8FhSv6hapGWbTGgr7
	 0dt+s9cQ7leNvTzWRaloZ/kcF6ib1hYYll5f+ndD6TwjKxYREgMMA3Tk2fm/XGdJzdlRm
	 EuOv0P6IpnZZPT8oPj/QkPNMos78x1gNLZtcGnVrmYXT43qqMWhfLeiF5n2x7RhQGkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=m3J+GsX+WNpN+CNr8o/skDM1rV99zjekIdQOJ3w/ua0=;
	b=At3uvop59m1IqvETiG2fBm4uhO2UIWjLRcy+FddnNCDtjrZtwgcOihHFInW/yVt1WU2f
	 uVBtjuUvu5h/kBhIJiP1KatlY/rb1lpb7dN/APOOnGpB2MgJSihAVjZ9cUKIffQYfNzQY
	 C5DZAUv3wTclFnzm5XPioit+C8JOdW3wTtLhEG4dkQE7ibAMOdAJqEHZWyli9pQqAjtGq
	 0k1IhLX7/+ncFeS1bwcPAd8MVu4Rb12ldmTeOOLecpMhVMT8Y4K8fw0glQ9SMD4cu2aXe
	 XwNylrRMyMN2hRdBkzZwyoVlRibMteCvVrn4zkdN/kTLmVsdWylfkFxBfA70SpRLYNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=MNPQzdb7;
	arc=none smtp.remote-ip=209.85.218.71
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6B0606A321
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 08:53:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C6B0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=MNPQzdb7
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c43bf48b6f4so20462966b.2
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 01:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792572781; x=1793177581; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m3J+GsX+WNpN+CNr8o/skDM1rV99zjekIdQOJ3w/ua0=;
        b=MNPQzdb7P63mm6CKF2vwz6MZWbbjyNcwYGU7Xzd7v0DUgk0fHkOQZX4e911gjbIvj6
         4qgwYk2bqxZNiBKz51ltd6ivtO1oFJAs1P9S46hiSUD2LeAKhtRZmL7gxwZFoFmSt4/G
         IBQatVnZI3I/7G6KRni11rbLJVrGdi/OVNCFAlDod3o8BRmHfuGHQn8ttwK681ap+s1L
         xRlOFy1wFruXgOA8zKzDFORlfHFEjI1vn2p7+BlplHEsVAjnhJu20+GoPS5W04rqX90n
         rpks1pyUQf9czLA8tL0Wh5wvAIUFA0rvsVaCT+dEj2pQb5lvD3yi/evBXpckn9omjGRS
         5ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572781; x=1793177581;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m3J+GsX+WNpN+CNr8o/skDM1rV99zjekIdQOJ3w/ua0=;
        b=TSEEtJuVnPV89ypwzLj4dY+j1Ib7Law7IzTx5+BLs7AoftKnQs2iDcPnC5zE3Xlt6R
         KVwwXPIEKwbhnGEfl116EST1mSRONZkaz5Dx2s3EykZ1fn1/WrBCkm20eTK6AwckFdPS
         jY1CNBGxSJzI38Xr4DNxVXh2z+1H0sfFse4IwuDP1xSRrTW0C0TIpzH7zTmCJ5Jg89l2
         LW/izb8Up6jWiAyVpd8X0C/tSAYNrH1RmozcD3jn3Iv8VfWLPRqSX2pl6Y+8+/rWBGsv
         yuDenxiByuFUuIJmx/8Zua30sYUSU56dj60DMMifbA5lfR3IJDlxunBbX4Wt6B3lrGpw
         rEmA==
X-Forwarded-Encrypted: i=1; AKwUvBwNdxDLaz6Na70BNkEAFNDSRRkE2rf7e3a6F4Jar9vkpwb4Efr3+mjyYXheDQs/US4bRAzdns1c53wkfbuIAQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJLBsy39/5+71eMyxaHDbDm/F5Ws2LEwgRwkNfsHpvTHMa9cv0L
	DXJO9VB7BkutKvePIdt1q9lHZSgwUrDU/HjbgO+rQH8WPuhgWDgCNtUar9k6QUyyEU4zu+dFsei
	Jp+xuqVeKscZp75UaeQ==
X-Received: from ejei26.prod.google.com ([2002:a17:906:39da:b0:c46:7d04:db16])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:4fce:b0:c44:9a32:b27 with SMTP id a640c23a62f3a-c4679682019mr123208266b.25.1792572779086;
 Wed, 21 Oct 2026 01:52:59 -0700 (PDT)
Date: Wed, 21 Oct 2026 08:52:58 +0000
In-Reply-To: <20261021033257.1359428-1-cmllamas@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <2026101318-stingy-crescent-b47e@gregkh> <20261021033257.1359428-1-cmllamas@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261021085258.427331-1-aliceryhl@google.com>
Subject: Re: [PATCH v2] rust_binder: add state_hashed and transactions_hashed files
From: Alice Ryhl <aliceryhl@google.com>
To: Carlos Llamas <cmllamas@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 21, 2026 at 03:32:57AM +0000, Carlos Llamas wrote:
> The 'state' and 'transactions' binderfs files print the userspace ptr
> and cookie of each node as raw values, which leaks the userspace memory
> layout and forces access to these files to be heavily restricted. Add
> hashed versions of these files, as done for the C driver in commit
> 57483a362741 ("binder: Create safe versions of binder log files"), so
> that access to them can be granted more broadly.
> 
> Pass a 'hashed' flag down the debug_print() chain and print the ptr and
> cookie through a new MaybeHashed helper, which either prints the raw
> value or hashes it like %p does. Everything else in the files remains
> unchanged:
> 
>   $ grep "node 2:" /dev/binderfs/binder_logs/state*
>   state:        node 2: u000000003cf2c740 c0000000000000000 hs true ...
>   state_hashed: node 2: u00000000abab9b6d c0000000000000000 hs true ...
> 
> Assisted-by: LLM
> Signed-off-by: Carlos Llamas <cmllamas@google.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
