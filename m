Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8332309EF5
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 09:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764666745; cv=none; b=s+MFiYW8lnWN3rNBe0aJWy5PG/jmBl0tS5ImiKPcmkGb3lftf3n41/52dk/U1LURJt66RLOKtUj1Mzm4fHivRm+OUp6D87He3o0xe1FF1MQTS/MoCl93JeCWvwWmsuYqlOe2uUppnvXqxMjX+zYmO0P40AtxoDxErY4qVqEJgrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764666745; c=relaxed/simple;
	bh=E3T+OjHk9k3SdIu0OA2Qu3bnmSjH8vh5ylUJtOrq1yM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=daJxycKhMx+vMETeoj/p2Z332oJ7ditBQHZoDVYKbfWlf9OxjZfbuR1SdYXFkjO2lBICJONccRIIC4EwvBh9pblesu/K6FTBFnJzmuQt6Bczuqdhx7Mn5YNgBfk3+81ro2Jkz20WCWIzUE5HS2noLpxvF8FiXo5b5f4mHshWtoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WQ7vGgnG; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WQ7vGgnG"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-42e2d5e833fso1322313f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 01:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764666742; x=1765271542; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bDEfZUB/KNMLfyYZ1hGFt2Yq/qTR/fS1dGGS9VWSrpk=;
        b=WQ7vGgnGh4Cv5Ltvi7EJYy3IJNwYKNlJ03XYFzR3XIUFRjsYl7PYgpgdfbChs2dam6
         OPoiQIsNqdrrfnJxuxZml5yC20IXo0kwQYAA2d9E7mP16y59dnVB/sn5E4zjhepW2GI8
         Qqn15wylVa1flNsngyEAX9hl4Zn2hYaSbL/GI08KeWPCBHhsDuKZz8iruhLTRVQvWF5z
         XgSS+Y05/lP0PjuA5T5w9rVuBF/VxxKLsJH9kevyxmd7s5Uz6YNBlzQLdL5GMyPbO1lO
         QzwQcnTUnW/944AqgGKxQ7VYFcRlie8e2aCS/Shqp7f9HIH9kSY/rbvnrWDKIuESiCjG
         gotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764666742; x=1765271542;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bDEfZUB/KNMLfyYZ1hGFt2Yq/qTR/fS1dGGS9VWSrpk=;
        b=OkaYfRQpiDO7he6oreIGYhKIiG0NoPT+Km64qAecacw3h2DWKqZmlURbvJ4fr9OhLO
         Q1wr5nvSvPzuexj6WvHczoBMJIo55hBzBexjeUKJpkNObk2qMCtDiZYzOtrl0wGYnvdP
         BbpelNTDM4b6uZ0rjQHacuxBsSOdfMv3e6+hVB+Opar6xzCudATPamgyLGsvKGvUnmci
         hdv7z0JqR8qjBWfeRY+jYYoDSGHrQZPJYXALE+K+Sa6pewkyuj8MIhMQcDJw2ATtvZSx
         HBumUW8wyxKUPLK6HH1zs31fbalUVkZ0vX6ry7n9qy41D3bVWjf4vIwadfvK+Ye8YehJ
         iJyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXagEa1vCo/njUG3e4n2s1M45b8M4uEae65yB2Ei+DAjBL4rxrW/OAP/W2QzNmgT9eau5XdkyG5WvUv3+7Bvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9cWW1InmjaAPg2hraIiSALXElib3jsqJZujxybdvnnQcrIDNf
	7TCcrLr8KwJzq4E03/qLY+wplHM1mp6yjCVEuKwj7HoMWNs35M/0eMUJN6pKPh+ZE05kOk+5slm
	y9Ei1EICdtHS8uzM52w==
X-Google-Smtp-Source: AGHT+IHnaDf0pJkg8njEUsGcK132DW0Uf/f6dPzwz4abBtqpPVIS+UNXR8Ej3ksMxhMZlOlU63QlGweoV1iVPyo=
X-Received: from wrbdp5.prod.google.com ([2002:a05:6000:c85:b0:42b:2f58:f220])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1445:b0:42b:3bc4:16c9 with SMTP id ffacd0b85a97d-42cc1d19364mr45726996f8f.51.1764666742187;
 Tue, 02 Dec 2025 01:12:22 -0800 (PST)
Date: Tue, 2 Dec 2025 09:12:21 +0000
In-Reply-To: <20251201165601.31484-1-atharvd440@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251201165601.31484-1-atharvd440@gmail.com>
Message-ID: <aS6tdXd9kSmEsQjo@google.com>
Subject: Re: [PATCH v2] rust: rbtree: fix minor typos in comments
From: Alice Ryhl <aliceryhl@google.com>
To: Atharv Dubey <atharvd440@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Charalampos Mitrodimas <charmitro@posteo.net>, 
	Yutaro Ohno <yutaro.ono.418@gmail.com>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, 
	Borys Tyran <borys.tyran@protonmail.com>, Daniel Sedlak <daniel@sedlak.dev>, 
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Dec 01, 2025 at 10:26:01PM +0530, Atharv Dubey wrote:
> This patch corrects a couple of typo errors in the
> documentation comments to improve clarity and readability.
> 
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1206
> Signed-off-by: Atharv Dubey <atharvd440@gmail.com>


Reviewed-by: Alice Ryhl <aliceryhl@google.com>
