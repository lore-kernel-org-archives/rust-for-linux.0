Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651E81A721D
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 14:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722524071; cv=none; b=mawl8+NsTs7FsTI/AUQ0b5zsvC5iDrOIc0FQTaYDTsReNaKHrkuXeKLXvalb7hwyDzeOfK0g93Ou1XaD6YJ8cyR7cP4E+1uY91nmdLDwBiZbX2fqABFa8imTW2zIiIna5MGW8D2ULVsRaA4OtZRZFB8F1ANTXyAGITJ6geUkIFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722524071; c=relaxed/simple;
	bh=qKpGpoABkSKp5w6u3HGBwFQQJnfdF1X+ai1CeDUq1Sc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fc2cf8VJVCRVgDm0Kn9u9SVt4a7Od6aG8z5Ndo7dwRQoValISu2aNwHAxfjB6200JYtlhQqJrSRfEPvEd85gz+cOO8Eq2LK/Bx3/mMyA/opsmvpLvNz3j5WajOohUoRCYAsIHPAwpKdPGJJSaCRXyWvIc8aGfwXM3k0xrZZ2vOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ppw3JicY; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ppw3JicY"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-368313809a4so1324215f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 07:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722524068; x=1723128868; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKpGpoABkSKp5w6u3HGBwFQQJnfdF1X+ai1CeDUq1Sc=;
        b=ppw3JicYDvrpRBfxHx6V3NJw1EQhIfnukxfljOZWe2sKZ0DcnFtWmEciV8fLiIGbG1
         rU/Kv87V69cEqpNzysbGCDklrGWKTWoHomm9zYO2f+8HQVwjTw4OzPj6l3+u509+wpuz
         Gkmh2NqmTnLudRd9mRxGKw8tFkQF4fykm3U9DbvWhaXFfvKbZGhq4y3R8xHEdrCyZ6T4
         D2Zhe2BYiiBEnxoPl5oem8llni+wy/2QbfDGh0rVnmXhouZm+uyXcTrzTplqGaK8EnFj
         KN21PUJsqLi1D4hd6M27VxAeFBAZJN/pmou5PdQlKK68Anc8vRjFxTXPZfj9aHs3o/Xq
         L4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722524068; x=1723128868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKpGpoABkSKp5w6u3HGBwFQQJnfdF1X+ai1CeDUq1Sc=;
        b=jg6PG8JOFU5yENzYUli6qygATEPlGgEuNN79nPf9VqK2mk8+Eth+hDEw5cpBqmqola
         rIZ8dBe9wyE+x+XybIqCPK0W4UuMh7Yqmmi80M6azGueqoxRTc0qHOrFv0GwugyOAUOU
         gqKZqho4o9VyQrMeyGnKnGM2QeoKAtNU1O8pKUkJjxx/Xc/iP97LQEDZ2gLOlZtVaFK6
         +c0Xy1RKgAHbiNfmS2/spGd814AZFY66Jz1JQlv/IjhpfEIpjGhbT5N965PBxlnIVec/
         0iGgYQ5cVK1H7PAX5TW36peKal9DDsPQruk3nUA7j3xi2ZG8FBtzgSKHOZ4q6tTjua/E
         O5IA==
X-Forwarded-Encrypted: i=1; AJvYcCVXbq3l80IkBMp8jqCaSCJY/tPq1fU4EmJtxrpGkL9erMrw1mxCHQOwM18rtfQ73U0cqQpdbMfo04VmiC8vZA034a50ULj4t4UULUZIMKA=
X-Gm-Message-State: AOJu0YwThq6DUwuA79PdBuRwqIZVp/G9EDxUZf94m71K5ptALbod4PNs
	2Qf6W6k0le1T1weD5dH74JcsV9hoH+pE/la8+Bf9f1AFfi7WFOk5Dr5UnINotJaAD/5rYB38SHB
	54FQZmr62CeDs5+j5QxI506plkNGb2B6Gannv
X-Google-Smtp-Source: AGHT+IF9Dysw+d6iU3bY6tA0Xzr0EV1yGVmyzivNvZhZYRb4OSI5V3ovk0R2a5GVexHyd9z+6BVIah4FLpQuPpgg870=
X-Received: by 2002:a05:6000:156e:b0:360:8c88:ab82 with SMTP id
 ffacd0b85a97d-36bbbeefe27mr246365f8f.30.1722524067353; Thu, 01 Aug 2024
 07:54:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801000641.1882-1-dakr@kernel.org> <20240801000641.1882-13-dakr@kernel.org>
In-Reply-To: <20240801000641.1882-13-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 16:54:15 +0200
Message-ID: <CAH5fLgig8nKSxXgvcr=8TOF6PZ+D_QqiEqeH2rourGDJbMa4Vw@mail.gmail.com>
Subject: Re: [PATCH v3 12/25] rust: alloc: add `Box` to prelude
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, 
	airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 2:08=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Now that we removed `BoxExt` and the corresponding includes in
> prelude.rs, add the new kernel `Box` type instead.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
