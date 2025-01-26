Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04A44A08;
	Sun, 26 Jan 2025 00:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737851113; cv=pass; b=SOPGdPHzvplPTPr2Tu9p0e6ndDQajGeOVwJE2JMvne31GFPvjiO3c4Z42nOpmYmGBRnUhquNvqkQpr0y+pa95bbs9uG14X63c7yRvmcxJGKZ5eqggRKBerpVtFCV4lFxQVggbJg9sqP7CtqgRKb7sdN6uFSNTBbHkA2XF90rJUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737851113; c=relaxed/simple;
	bh=pjNvPQx2r6MdO2yXuOMoAoLY0u19y2tfgzFVS94dR9k=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=KtwCVHDblgwubBBqNFJU3QMsfHSJMf7epRtr3CmIgYzZL+Q0RRg2Ia1JuQuR0j3WlDuCwFfiOcEwEnz3CQFwLIS7mM8m2WkjF8eWI1hAhxThKtI/KdQFnm3JwcFoI8OEMsQHvS4fqqdde96PhGK1UFf38Sw07LoQMWWytzPmKJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=ZMKAJURo; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="ZMKAJURo"
ARC-Seal: i=1; a=rsa-sha256; t=1737851096; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=oDEN4VJQ4vfSDITl+2BWLxGHQxWDiUwlgJr7yB0Ps48lGO/NFXjgEj59xCdq9v68NiQYeBFeq/SCJwBpO+AtElduRTyqlUaaPMSd8bZN6uL/jUc+AicUX+9dKU8JxdarkX46ooQhATzmAqnXwrt+PsVqg0ckSsNZ7qoVTaIyYgE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1737851096; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pjNvPQx2r6MdO2yXuOMoAoLY0u19y2tfgzFVS94dR9k=; 
	b=eMavY+whAxD7eHHBKntzHteOeDXjFAaTJtT9DM9GJdHs+lv9AWSDNWt1wF9Kjy5Yd5KSNAl2aVQ1y17jXr7EVL4otg81XlVzq7kt+n63SYV8fC72/m4rMJWIhwC2Daqaye7tW7NasVXbEy4/+RKOgnNCocL4rQFSFZz02h0ySSU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737851096;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=pjNvPQx2r6MdO2yXuOMoAoLY0u19y2tfgzFVS94dR9k=;
	b=ZMKAJURo/PBR6OYn8j7QvynekCznZsbQUtUf05xHgPFmCLj8PmaiNuPCtqgzss91
	dRJilraHPb7H7Lp45H9A/M7/cmVdHpWimZc/inIlYtO2LNOKnfcGiRPgUcEDUBDOUmY
	veJHVC46lCcGc0Mc6FRFeFsWELlpHPTr59atRy1Q=
Received: by mx.zohomail.com with SMTPS id 1737851094474571.2311440586574;
	Sat, 25 Jan 2025 16:24:54 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH v3] rust: kernel: add support for bits/genmask macros
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250121-topic-panthor-rs-genmask-v3-1-5c3bdf21ce05@collabora.com>
Date: Sat, 25 Jan 2025 21:24:40 -0300
Cc: linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D55E4F65-A9F7-446C-BCA7-44156D4BFEAC@collabora.com>
References: <20250121-topic-panthor-rs-genmask-v3-1-5c3bdf21ce05@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-ZohoMailClient: External

I just realized that we better have a bit_u32 and bit_u64 too, otherwise =
this
can get a bit inconvenient and clunky.

I will send a new version.

=E2=80=94 Daniel=
