Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBA726656D
	for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 18:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677723; cv=none; b=cVmgqBF7M95jdWTqbhYi9ii9BBSrvqEDqjbvuqHT2tQiQjEvsgUEdYdt6oYdA06EZlz/f3hq2g/AnJXVciX87z94+tXbAKNngy3H1muJN7o8Ll5qRU9kcFjfsziRwLgnmYRCqY+IXEyqfBDobOt5z2XeFtnWNhAKlUFdW+HwVvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677723; c=relaxed/simple;
	bh=fmV6e2SoApJL9fZft1h0EhXTTUFZizOKyTsHJ/sJGdI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bG+dgGEoZtLjTN4SQGazqzYbCB2KRxqZrQxe/r4VJ73757lAQtKCJo2/px5qaQ5vIqIjWbp4aPIUCyZKwE69Cv9ZdnBoEl/QvHrvQmrmQ1ipYw1RS3U1Zavpy9iZxT8Pt0iL2Gs7hYyFZ2gu78+obdab/nb+2NMDl4Xo1e53ln4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VlK2aIKl; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VlK2aIKl"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a35ec8845cso1785470f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 11:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747677720; x=1748282520; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7VPWSW12tztpw2CQM1Lke535S1u5tfd//R9jqCHi/nQ=;
        b=VlK2aIKlPEYWf0lue/teHTQKQwZQJF/69Eng2VF4AT/UqSVCy6GnrP+rIumvQ6wlkr
         3KWjcr00Rz8Eat2yrRd+KXBJmMShoiimMbGgJO1svfHnIpa6ziCvyEjYBfqv76hGdeWc
         C3RE6/Or+vIB7g+/XvxJQThLbfy8yAdZwnqZu/QL1IKG6KMNKsMvC4X8DfDS/YUbTz10
         /BJNroaVFwiTaC7zJC+gReLTtrP4vcn932PmJgtnnReAfiW8kL/+B3JfNNREz/QhqrH7
         C5Z/Ko4ZRdZE9cXsdeQFL33TOD6w7exFy7soNtC855nYhFJNAWWv52GEhP7/2VE0CNPr
         3Y2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677720; x=1748282520;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7VPWSW12tztpw2CQM1Lke535S1u5tfd//R9jqCHi/nQ=;
        b=H+/edcYc43yXWFOhKIcU2FClCaVn37umtSwmDoXbiDmBThhw3QxQIzId8fyQqn3YZQ
         4T7WGHimmFJkufGRbSx+lSjbDrpm2OLIZMURLzwxCV4M40Gp0Lenm3VQWbvstCZi4YOa
         n6BZe0h6nz5c82ONk1bI8RD+PrrHVt+McFiAix5nc1gQdCBR9/dRVt5dmflg6x2X2063
         SkPio8YNeaA82Jku1dQza0Yw2GQhDlRx75fuqTGBnxhWbih8PiA2QIMo0xtqkqlL4qok
         EQbDF5tGL9ncbgPsAJChsNi+6mjX4Oywp/0TcY1QQ9XjDEHlVTkNEigVnVqSwSTA3+Oc
         yc1g==
X-Forwarded-Encrypted: i=1; AJvYcCXRnuYytusCpJcy8K3MHxjA/ENhICAalekKZGMkbLhaZZsO86tdBcUGr7j+YHF25AeqH5OoFNAjJ2Qqjna5aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMwInWienc0C3uayafgJtcD13b4txknbMuS4oGgo7l5itO6uJm
	aAOlIjur+bR6N7x3fWg/TPoTxkOPO6NnrPdhMzyTT4G/qQM7NPPF3zzEoIIk/JLPHP4zxBJoRnV
	7jlUM/22JTGRUgkkGtg==
X-Google-Smtp-Source: AGHT+IFJS5J+PnbHa1RGDDnQqAtZtergrw5iOIz7IkL3LlRlfJiUovmWWT/ojC2/wXOc/jLurPsAKI6k8uRKjLA=
X-Received: from wrbfi18.prod.google.com ([2002:a05:6000:4412:b0:3a3:5c04:8b60])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4310:b0:3a3:69ee:f4ad with SMTP id ffacd0b85a97d-3a369eef6femr6547198f8f.22.1747677719934;
 Mon, 19 May 2025 11:01:59 -0700 (PDT)
Date: Mon, 19 May 2025 18:01:57 +0000
In-Reply-To: <20250517085600.2857460-1-gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250517085600.2857460-1-gary@garyguo.net>
Message-ID: <aCtyFZwt4jGXrL54@google.com>
Subject: Re: [PATCH] rust: compile libcore with edition 2024 for 1.87+
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, stable@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, May 17, 2025 at 09:55:59AM +0100, Gary Guo wrote:
> Rust 1.87 (released on 2025-05-15) compiles core library with edition
> 2024 instead of 2021 [1]. Ensure that the edition matches libcore's
> expectation to avoid potential breakage.
> 
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned in older LTSs).
> Link: https://github.com/rust-lang/rust/pull/138162 [1]
> Closes: https://github.com/Rust-for-Linux/linux/issues/1163
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
