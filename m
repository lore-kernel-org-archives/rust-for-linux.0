Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5C61FDE0E
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Mar 2025 14:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741961981; cv=pass; b=bgSXJ+Qk5UnMuJgoWD6HRopaWo30tq2SZc5HrdsbsQhngMKleoD3boQP7cgbp1TDoYK3A7Mm6GD+LTQlye2gjEeiGDWeZC9sx5BAWXlYXkW4ZOX5CAxQ3Oj6GwmIj2Zjhd0spq5mBMNES64bFjIMFgPjB+WJXFg+BkVG8eUTq2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741961981; c=relaxed/simple;
	bh=s4Bo7vAGf03NLhUlfmxHpxirp1sQzPE6hZaWBAxsDMU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=rWMZ+P0b6FZWHpNiMyHA/Dvjlz8qgeElxYjGlI++IT2swkfgMVZUtGr/i7a8mwXyY3ElrW7A7Zl0v5Nqw9vpsyEQMpNiE8C+2U06r3dalJE1INznNCIvt1NR/xLDqcYmkGWFAbVK7FXSzRQS59w905DLt0exAxpJD+Q8SViCgS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=C5L/Yz38; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="C5L/Yz38"
ARC-Seal: i=1; a=rsa-sha256; t=1741961954; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lwfa0tkPnzNwiaFuVmDP7FMY1VA4LCYjYbz1bDZU4a9fIn4Do9ipOd+JNl3rMizLuCcoWxt9ubNhSWPjlgO6Tm5VakFPrXLnm1hFHTm6C2pYngh3jeGEm9HgHgeRIUqIVyph+yhXaCe4U3EX4DIDED2j2GowasCBEW0GCxJBDPk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741961954; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=N3E+qEU1v3AArQxLQksDVAjGHNViblix80C5G3+laPA=; 
	b=QCIpXm3EYTUQ24hAYxHOaBPxrBUoO4b2YGxuam3WxUEF/B49nl9PuGdvaub1cypBki7emzCXpe+m+yuT5hBEX39zfz1kuXxd3X/rEo3sq89ypl6njBbA0aN+tvvc/c9GVvf7QC6raFMQdMMe0IpXk1JgBvEhoufRU+I/N4+HHLk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741961954;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=N3E+qEU1v3AArQxLQksDVAjGHNViblix80C5G3+laPA=;
	b=C5L/Yz38RLcaSAmw6CXReC9cExBU6crf4nhYfuGWvXPOjVroF9lGR8WUSRzV+IKs
	AtZh+rZsXuDDnUOU/dXYA+ybTvaY16Wk0Apv1h7UYwFUrVls/zGukxpRuNy2oMlXEHE
	T9HEkIm7v/R3Btx+yVUaOZ9OK6hrDfPFjLtQCGVk=
Received: by mx.zohomail.com with SMTPS id 1741961951886914.1539316541287;
	Fri, 14 Mar 2025 07:19:11 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH] rust: add new macro for common bitwise operations
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <2025030439-sharpener-overkill-ada2@gregkh>
Date: Fri, 14 Mar 2025 11:18:56 -0300
Cc: Filipe Xavier <felipeaggger@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org,
 felipe_life@live.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <1A434368-6B92-4C64-8B5A-17499C8E2F1B@collabora.com>
References: <20250304-feat-add-bitmask-macro-v1-1-1c2d2bcb476b@gmail.com>
 <2025030439-sharpener-overkill-ada2@gregkh>
To: Greg KH <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-ZohoMailClient: External

Hi Greg,

> On 4 Mar 2025, at 11:09, Greg KH <gregkh@linuxfoundation.org> wrote:
>=20
> Nice, but why not use the same api/names that are already in the =
kernel
> for this type of functionality in the C .h files?  That way we have
> consistent names everywhere?
>=20
> thanks,
>=20
> greg k-h

IIUC, there is already someone working on that [0].

Can we just leave this macro somewhat as-is as a mere convenience for =
driver authors?

My latest review comments include a name change to make it less =
confusing in this regard.

Or if [0] is not what you mean, can you provide a more concrete example?

=E2=80=94 Daniel

[0] =
https://lore.kernel.org/rust-for-linux/20250310161947.1767855-2-bqe@google=
.com/=
