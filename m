Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADC8234964;
	Wed, 28 Jan 2026 19:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769628418; cv=none; b=agNhdnUxUDtjHqUwAtXJqtwJlK3DP60cyQ+0ml8f2kSmIf1zHyx0iCo3EmlHDzXJ814AS2+Ry1ypsjLsjUhhOELWDuM3jeAg4mkXfg/ppRkpEiMu46GfxYM1Tu4XiFhBiGw97BoTu4Ql7mhd7Ul32BOmvzuEGWrxMXMazC+dhHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769628418; c=relaxed/simple;
	bh=TzV4pN7PRtR1UEKT5f/yZZLm0hl7atb4Md8C61oAa0k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=AicrrcGWtcQrLSiYRY3q6HdiBYM4um3jJ6J4qAjgR156FL16oWElaTAUfFSS6BTeWHacs3pq+Jdqm/z84iRrt/Oa8Oje5Xm6mt4JuqTPJ3lAy8jEV2sCdqAcywfLt3hiIQ/5bHM2DVjhSgAwaoKYnbgNNfxVgaDuvtlcXL57y3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELD4D4oX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELD4D4oX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA3FC4CEF1;
	Wed, 28 Jan 2026 19:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769628418;
	bh=TzV4pN7PRtR1UEKT5f/yZZLm0hl7atb4Md8C61oAa0k=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=ELD4D4oXJN//Zhj64ZhnVZsx2Q+soZTAAGbXiKIVrr4h7XNzbU+rGkHICpacU7oeO
	 ld5iX+kSEfAjP4/swuXMGwM3KlSeKKl/V62RSuKF5shxh08UDlk0014KitQAxSsVEL
	 FnsuEBJWY3xgKu3x1ZBPHyutwu0Xd6hIKMmA/0DPgGZsMtE2ADIw6aqhsrYrdymzQr
	 VA0ih79k0yhKFuZ+YqFLSslj5LRxnfxqnBrcTYe8hfZenYKH/Lkj+frjtPVd2wseK6
	 LHFkbcokjk1Zgb/V54wZHsBMuOyzU4ig1Ug/RvRp0t/oeTQnH9IK9J8rwufEDaAhsp
	 Ez6WBXYjFHDNA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 20:26:53 +0100
Message-Id: <DG0GX23ANI54.2PQM2BL2IKRLL@kernel.org>
Subject: Re: [PATCH] rust: alloc: add GFP_NOIO flag
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Lorenzo
 Stoakes" <lorenzo.stoakes@oracle.com>, "Vlastimil Babka" <vbabka@suse.cz>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, "Uladzislau Rezki"
 <urezki@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260128-gfp-noio-v1-1-9a808fc49b44@kernel.org>
In-Reply-To: <20260128-gfp-noio-v1-1-9a808fc49b44@kernel.org>

On Wed Jan 28, 2026 at 7:37 PM CET, Andreas Hindborg wrote:
> +    /// [`GFP_NOIO`] will use direct reclaim to discard clean pages or s=
lab
> +    /// pages that do not require the starting of any physical IO.
> +    pub const GFP_NOIO: Flags =3D Flags(bindings::GFP_NOIO);

How do you use this? What about abstractions for memalloc_noio_{save,restor=
e}()
instead?
