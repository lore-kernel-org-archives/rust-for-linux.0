Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676783;
	b=nHmZWaYp7CD7FRyA2zcBwuBAFn25uSGcbTlbL7NBIuvUF3HcD8Mt/9pwbJnYeKBKFnNf
	 kxDPW8IKn49aCs/1hRwA37IbN6ohaSBDCAO+4a/XQvTT0PP6lPKKsvG/gp+TNQVMBGZrI
	 7Dn7vhsYSW0iiiza8kq/lNO8zctirdYaWwKUsS9OdPo64pkHvHfQY5JlO8lLLEjBfcBTL
	 RQ/+VXfTJxip1i6UjwWOGwHORaiIko44zVUqu7wvWx2/A3Opuqwa9NXnC2fNOV1RwOgBj
	 ICFF9Z1Ecs22ZKTTXcDLOZpz1dvejX09isPFzQ6AlEG6bTFkvj4ItgnB669sngJ045w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=blxhEUIfGLP2KtavzgC8b8uBHeJsrYpy4EDXOcxW8OI=;
	b=pnX4umSbidoSFW2aqJXrJTb3y1M8fYAWD8qca2D6kAiMcFoP3mmWUWo/celtSnPg7q1O
	 Xpg6vUhH1BHnwngOYxCYrakiU7AFtLI1VjF58wdjZtgwsaOFLrn2vEZ5CYu+P3//GQSm+
	 WJhXrI2qHE/Gs27U6eBx0XSzXK71xQrmB45S+5pIustEqNBI73NJYpjExjX5Kjd07OcIa
	 nzNfcPwd+y7l+iP7znXqlrStkXANUXDPpqBJf3sGVsDmWeqcT0/w33XRsOQEaWVattoxY
	 HnyFe+qqDlYToONOm7pC3sECqycHyG6zDO5XPxTfKx3YYcJeW/dj7APQRchvifWF5UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Jww261xB;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EBD60A6F72
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Oct 2026 13:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34EBD60A6F72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Jww261xB
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1d7663a4dso17095235e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Oct 2026 06:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792676781; x=1793281581; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blxhEUIfGLP2KtavzgC8b8uBHeJsrYpy4EDXOcxW8OI=;
        b=Jww261xBpSru1+0lRUM4SBF0V6fwOoSie6kmrl++BTi4hF385U5NGD8IevSuTcVuWo
         l88X9Tv9J4AosP7/V0zYZK+qfzCwHdbXiWsV1ALh2YXoIE5ynddg6iVJtiZjEC0v4GDr
         6EP+mUbKhXKAGNu/esbIhvKaOhs0dpFhBEOWwzMy7vZROOXVsXGON/Ykk7JOSe+lZmIw
         1Bye56bZwcN8yK5SwjmHIdGjpWlDw3a3egR9wdnNKaW40F4FhOwtkvwHaMSKPnDusMVp
         nl+UxQ7cDtIkY95eFv9HV0pgIPSIofhYJJMUcpIbe/8Ntfkb1n1h8S6Jl2xsaQxhFyb6
         XcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792676781; x=1793281581;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=blxhEUIfGLP2KtavzgC8b8uBHeJsrYpy4EDXOcxW8OI=;
        b=ulgFwLYxVpC/NSuc9ix2gcx8KD7HnypacLXLEuD5avey0s+/kcWfiO7hFdbkpDMlfK
         upJjfyavxt5s8AtHVngAldwJ7H/qOqfWCpvuqMRxGAmmEzQid/wkwDuDRfv5zdJFWWJB
         Xo6xbJeLhGLIVWlpHYiuOkUgxKGoyc7tBzkTJiG2qxlJ/LGf5mzFy6ljL8ZHyFXSzKJS
         oyLPs81m7wlyDHGzMROE6gOXqMaBlUrgoVAafpSRU/HeXcPimxt5v6tM88Jmp61K3Yqr
         DA7ku7+IAv9gfhRue8rpBTTMRVnRDSpKQKEUV2YAF+P604vbiXSjbJUATO7JA9OD/SQC
         Q5fw==
X-Forwarded-Encrypted: i=1; AKwUvBzAV1zWelACnBvD0dY29JeNaQcFC0yD9lLByibN8B8uxlEcm18GZqbyVDskybVMVgro9PsNPLpQbVRoVeWEnw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKz7t8mznXdkNtifZx7t/C/tF2TfyUMkjRfYKGJKG01YqbDL2xN
	2XzwJLTQmpjRekwiqpUCRWZRr6idvhcQKbAMBDrV1B+raZi7z04vLJNNYSC7XQJ6svV8pMHVg+2
	qh7gcQCjFT9pG4w==
X-Received: from wmpj21.prod.google.com ([2002:a05:600c:4895:b0:4a2:677:24c])
 (user=gprocida job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f95:b0:4a1:6c0c:ab93 with SMTP id 5b1f17b1804b1-4a1fdd109camr111705995e9.28.1792676781351;
 Thu, 22 Oct 2026 06:46:21 -0700 (PDT)
Date: Thu, 22 Oct 2026 14:46:15 +0100
In-Reply-To: <CANiq72mN9JYVitqgsZ2GkdmPVWqHZpJ-WNMNviiHV6C7gQMUwA@mail.gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <CANiq72mN9JYVitqgsZ2GkdmPVWqHZpJ-WNMNviiHV6C7gQMUwA@mail.gmail.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261022134617.228229-1-gprocida@google.com>
Subject: [PATCH v2 0/2] clean up EXPORT_SYMBOL_RUST_GPL
From: Giuliano Procida <gprocida@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, linux-modules@vger.kernel.org, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Giuliano Procida <gprocida@google.com>
Content-Type: text/plain; charset="UTF-8"

The two separate patches now move EXPORT_SYMBOL_RUST_GPL definitions
into linux/export.h and prevent the emission of bogus type information
for Rust symbols.

Giuliano Procida (2):
  rust: move EXPORT_SYMBOL_RUST_GPL to include/linux/export.h
  rust: exports: emit ___EXPORT_SYMBOL without C declarations

 drivers/gpu/Makefile                      |  4 ++--
 drivers/gpu/nova-core/nova_core_exports.c |  2 --
 include/linux/export.h                    | 14 ++++++++++++++
 rust/exports.c                            | 12 +-----------
 4 files changed, 17 insertions(+), 15 deletions(-)

-- 
2.56.0.218.g1ec904b173-goog

