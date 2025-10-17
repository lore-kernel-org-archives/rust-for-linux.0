Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2085332EA3
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Oct 2025 13:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760707483; cv=none; b=N6C8j0Qi3sazC/QrEewkgkytj94BD3OG+3P3j6ZE1+D2w3a/HW94Ueq0GGE6ZEJZ5FR4Y1GZKu00yyxi4ry6k3TdP/fMvkYrf/LESpdrkJB9WlpvkdEfVKN4lhr5AF+J8WLf32/gRYLyuYXKVg+KvEqE3vaZOvPpON3+1eu3yxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760707483; c=relaxed/simple;
	bh=GgEzp2Fj75nh7OEKAeNg1afv+M1lZPOXZ1gMVZJFyFU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EndrRdOAdc7l2XNyGqcerO7qlYZys9wUuV7roAj7EwTdlQVV6g5BIp7976guQYykZHGEnvPE2nHCXHS+wDsmpRsp9Ia0knhhmqKV5B4HwZhcEcWFQPD2fUhZnOaEZMAWfsYmbg+vyOqMkXxUWOcD/uWqG/2TxZhgsyIrSDuKE7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1vtlZY6U; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1vtlZY6U"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b2f9dc3264bso307848066b.1
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Oct 2025 06:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760707480; x=1761312280; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kAPzxmZAKRETv1aAgqTv/3Qe7/Q8DRU161MvWKOur7I=;
        b=1vtlZY6U6avpJ1dQZ4DNVOEzuLGhC7CFo/DtvH65EalW54yjQB7wfyQckKTv4sm47v
         +Kz80tBfIOarskHYsfphwM5bWs2Al/Y+hYSmM35mroZxi0bX7fET/BS2cfGRVslX7twh
         DRZxZ1hvnScEkO8pH3F7WVGUfSosuCWxZHXqU7/yb4suP8Umelzh8BPytSW31cnyIZBh
         V050aWGSha/hU7e4TBTh4dAGgo9uVqbjjfEe9dVJ32Q7jvYMtg5f31dajfJZFZtGOocS
         fDblQyy4lott2QfHk6JRB4yZZZivr3zTCvcXm3kJChCA4pjfFz5723N2jl8ogrd7KNaZ
         hadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760707480; x=1761312280;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kAPzxmZAKRETv1aAgqTv/3Qe7/Q8DRU161MvWKOur7I=;
        b=GcIHUkDNRglVLlTMtL6PE7BFcDEtw98EeNuez460Rn/9BAkxY4hS529WCQdMhYn9q0
         cx50q5/plk3AwUn9/DJcJAxFDl9/js9fKTK95GKYZxneEgQaV29UecnNMP8MeZHuBzIC
         KSvpNfFlJmS6I8BJMJ2Co26yBPEKhrmVVzDQAU/knh5qI72UJsoRXv+EMxWZe0kNQgyq
         QEblvVbSelxSGnTMGsDyGX43QmWcWsnA7DQp7Mv1EX5/Na3fdHdnsEjxuR8RHZN8bBV5
         d9EY8NeLZcvJLbHQhkUYpT0o7bqsecxSCEjMcwwuwg1HAoVZWgq8kh7/8OWeRs75gleI
         7QBg==
X-Forwarded-Encrypted: i=1; AJvYcCWJDhmsuEI0JxxzpN6dm93XRZZ1Gy8JgBhc4Y6sR1v9c4zDnIEMbMQAxcK33vb+F1AU3u7aXtMq3yM23fgd8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YynUWX+A+JSgNzSt0/2bRKoAugpDWF3lQL7+FfNtbYCBaaZuw/G
	nQMGHPzT6Ti9p9SeCDBWGSu24lDctlfA0w8UYyQ6V1uecHcDB39hQw/sT9eNv8VbSOBuhCdmuEg
	irLeVgyjAoto8mP2f/w==
X-Google-Smtp-Source: AGHT+IG+iL14vecShPyktC8BwMaW/uSlauMbjVXn7jXOXVhUbEdp41zM5x6FEcncWa9dDOidM50s71O00B81dbI=
X-Received: from ejap10.prod.google.com ([2002:a17:906:228a:b0:b47:8176:fd79])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e85:b0:b3a:7af8:c4a2 with SMTP id a640c23a62f3a-b6472b5f826mr440021066b.10.1760707476223;
 Fri, 17 Oct 2025 06:24:36 -0700 (PDT)
Date: Fri, 17 Oct 2025 13:24:35 +0000
In-Reply-To: <20251016210955.2813186-6-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251016210955.2813186-1-lyude@redhat.com> <20251016210955.2813186-6-lyude@redhat.com>
Message-ID: <aPJDk2mEAOWoyZC7@google.com>
Subject: Re: [PATCH v4 5/9] rust: gem: Introduce DriverObject::Args
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Asahi Lina <lina+kernel@asahilina.net>, Shankari Anand <shankari.ak0208@gmail.com>, 
	"open list:DRM DRIVER FOR NVIDIA GPUS [RUST]" <nouveau@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"

On Thu, Oct 16, 2025 at 05:08:18PM -0400, Lyude Paul wrote:
> This is an associated type that may be used in order to specify a data-type
> to pass to gem objects when construction them, allowing for drivers to more
> easily initialize their private-data for gem objects.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
