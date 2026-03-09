Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3FB41B35D;
	Mon,  9 Mar 2026 21:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773090573; cv=pass; b=lQz2INVZiqUVmkr36rxv0FH1OhvzajSBLEt8ynqKE3x62ImmbEM3ThAYfOZ2ciCYhUIXN//vGsFXHCWvEBx2YT51ae/oJEg79U/+UBtrBguXfrBXK3eZQGp3s6704Wd3EymKwzjgBnyT3CI3IzOG9+dvFp80Tmi1lMibf9oOos0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773090573; c=relaxed/simple;
	bh=qDTvNS6cIGKA59zHh1a6irMtq2Tj0Muev8wCuKgyuac=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=LNLBPyZOHfFkw1ywC0XtxJa9YnZtlBLu5Itt7V4VkbgzrYH8zrr3ocUaYICu6iFnbIoyC4b2MGGNK+FYnQiGIJjnYQDa9qj/4Jn+fmzEogLktjv0moZ9gDwzkw/A4QIo22n3GanU4Dg95ezghC+x9Qa7IwHEW2yCIgsdrgfTJDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=E4FmLzrB; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="E4FmLzrB"
ARC-Seal: i=1; a=rsa-sha256; t=1773090556; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NFklYgfGMwZf5EDlsJsQzE4cMQ38mU4FSVQ5d1ckpRx6iXvkldj/63Rxv3UHV0Ec4ccJUoy0TBOzMNUmyejYwBVcJHtvI8t6hrdkW8vbeEQwyDWPTB1WdRgkbJIHSWNDHZUCDLKeS5z/KvbH1TU/LLucQYO9bvMpFVlmyM95RhQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773090556; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qDTvNS6cIGKA59zHh1a6irMtq2Tj0Muev8wCuKgyuac=; 
	b=KnmRjXtvP/3lR2ow5x1Pd1rSvVQQSBuDjELwT8JIeHBUbenoVA4ejME/0h6prD+6NXVKtRsdZzxg8StI/Y1z2TWOt+Tw+Pr4N/R+DapcWIBJYQ/eiAjdpAxYgp00ROjq+dXovq2YyXepbp7leFBIEqIyLJj8SL5+LIAJgzLnC9E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773090556;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=qDTvNS6cIGKA59zHh1a6irMtq2Tj0Muev8wCuKgyuac=;
	b=E4FmLzrBTTiuiRF1nmGXuNUYOHWlWBCpQFVg7aJ3We/pJ/QCPbXzXC9zoqzwP3/G
	l7bc7mQuD1GnuxfC0Im07mhkzFYjFbfPRLmNnzJ/yOypVFVUfoq375uByS6B2iqPeJI
	+s68UvudLxgW2NnieaD2R+/VTzxfPnu4f7O1ZmIQ=
Received: by mx.zohomail.com with SMTPS id 17730905548991009.0604464943193;
	Mon, 9 Mar 2026 14:09:14 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v8 00/10] rust: add `register!` macro
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
Date: Mon, 9 Mar 2026 18:08:56 -0300
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Boqun Feng <boqun@kernel.org>,
 Yury Norov <yury.norov@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>,
 Dirk Behme <dirk.behme@de.bosch.com>,
 Steven Price <steven.price@arm.com>,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E454818E-6D9D-4913-829B-1CECDD2956DC@collabora.com>
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Alex,

We will test that on Tyr shortly. There=E2=80=99s a patch on the list =
that targeted
an earlier version of the macro. We will rebase it on the current one.

At least you get one more user from the get-go.

=E2=80=94 Daniel=
