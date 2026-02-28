Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADD2371465;
	Sat, 28 Feb 2026 17:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772300143; cv=pass; b=lXGq4vkr/QjddVwfGf8n/3N1jwk9GGT6Rfgl1HDiSmxtUsp5xy8E8CQzdfjcTNLZhU1RfjtGo0uL5UZD77BgZAkugWfsApyoyKNr89f0yvVZEZIiuTyEfSzKDKtf7a/wgOwbeRHwc7+49N/4DW6jVVSZ7ZwCViQFbWZfPxo15uA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772300143; c=relaxed/simple;
	bh=tnihtFJNzmt7h/f1sP2uom6gn5kId58YFeyLasqpCsU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=jTUs2A7stgdtFpVaVbdnHPlzaSHkfFKMeE8zP9TZxf+9L7DkAEdh0C7Jo194nA8+MC0BU/m3SPtysGHqLSiqG8XN8VfakyOFx3BM74DRA7tQNPsPj+om8y4vapcWumkR7dbc8u/KjbOSw7ozC2iy0V00qRLl46pBJL0dE8iZ688=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=KuB+4o+j; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="KuB+4o+j"
ARC-Seal: i=1; a=rsa-sha256; t=1772300125; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iCmli1x+qqYxzy37SKwwgZV6ccmtjgqhOjoZ/aOmYxQbBwQktCAD78QO/wsVqYSOBFGm5HFIks3mWkN5oo2COGAX/hAdFEmHDe8U1z09LkAtJNxet1G+RBRjFPwKVm4+UYAHa+uRFcX/sGDyIgMnT+wSJ9nBv5ivluWzNfqY0B8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772300125; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tnihtFJNzmt7h/f1sP2uom6gn5kId58YFeyLasqpCsU=; 
	b=BOVdMoC3kfBcPmFXe0rVqTmZVYV+9KrKtIS0a+Sp7M8cbLYQ2ZH/89j8m4oZBwAPjNRanC0rgt/UCxwS5mdSrv8mcVgzXAqv4cZ7JtsN5D6w7PR2VzYEOnVMxAq4JC7uWJGpF8uYooc24oupeI7yof6IK3D5tIdIuLZHC+viHz0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772300125;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=tnihtFJNzmt7h/f1sP2uom6gn5kId58YFeyLasqpCsU=;
	b=KuB+4o+jm2EQ/3nggJHEJc/LVCaJanjXJmFwtS/XuL5lSO/uwEOpkuYIdKNUfHnl
	HEaELqvfFzIiUHdXDaqAxPBbgdQkguZiMmzCCwvIKcwWx/iAdz6eCrjWHF5pAkdkKZe
	pfMYeSoiJMaJzHq9j2S9waBAymXukFrRcEiycSPU=
Received: by mx.zohomail.com with SMTPS id 177230012304395.92709734053415;
	Sat, 28 Feb 2026 09:35:23 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 0/4] rust: Add ARef support for work items
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <196AEBB6-29A6-4F0F-917B-A042F422698C@collabora.com>
Date: Sat, 28 Feb 2026 14:35:05 -0300
Cc: rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E0BC3E06-FF0E-4EAE-8B7D-FFC1630F537C@collabora.com>
References: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>
 <196AEBB6-29A6-4F0F-917B-A042F422698C@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Tejun Heo <tj@kernel.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Tejun,

AFAICT, there are no further comments on this series. Can I get your =
feedback here, please?

=E2=80=94 Daniel=
