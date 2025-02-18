Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3421474D3
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Feb 2025 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739873015; cv=pass; b=JzgYXQbqjdsxrhHY6Fc+/En3HSt2JGW1HOBi/k0aYGWdMO3ZXnw29fEbi7ZUrnsMeiWg/73rYlmW1CTbT+nsMMwC1A9hsXdRcoAVBGR63U2Ysd2QYhk8TTD/9ySGwNFm7yzziEWJTfqGn0qFIrkBXXyG8cwl1G0j7ufKxy4WLVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739873015; c=relaxed/simple;
	bh=Bx2V4Lzpn5MzobTGjw1WJFsuAlyAyeAyWwJisq/Ncio=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=FRSvjRWpoNB7rkm3UlL15kSn9sKgg9mHaBGEqmANchbWcb+4EXx2ucZG118gLNs4d+fol+f0sm/JSMgkmZjolgY6MvU/UwnXFK5GPr10eRbQPbzB42AAxmSQ3beCtySLAcc+qAKwyUW+girtaOcgRBB0L4gOnbBQJsHaz0HeDKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Jbv/r9H8; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Jbv/r9H8"
ARC-Seal: i=1; a=rsa-sha256; t=1739873003; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h205e/NH+VOqqE/dezsImjFAOQ8IOOpKy9+E7KwsNlvBjEIz1gRBJjsxxelySRtAhQDKxmDPn8NCuVqNiGjxoz2c+ri7XnByeLNvD/V67lMgWbo3ZpatYj8X/viTPTA0KOQ12Q2/2J5jb7HXhuTQmBw3c0M6OZSUkFRgWRPt3W8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739873003; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Bx2V4Lzpn5MzobTGjw1WJFsuAlyAyeAyWwJisq/Ncio=; 
	b=RfyDlG8kPK766AQpPW2uUKsf+4MlhfVb2oorOo+qWQhjnzouQLF1EVaOxO9okbLkCzuxAxBwqZfcUJXFomUsPzt/sFxx/qMZ5HK2f85JFZqinmUl56iCS6LPjC0ccNocQNK5nF7qYR/DJCP31i3jL2XluBDBdVuGVvpSG7wa+hw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739873003;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=Bx2V4Lzpn5MzobTGjw1WJFsuAlyAyeAyWwJisq/Ncio=;
	b=Jbv/r9H808jmTZdN70FbG1q2qXer/sv6NTasJV7zBevXVfyZMlb7CHjMh87B7e1Q
	LFuKHP0EXDAHlpCIyuriJmh17DsiIiaytcVp38zVd5uGa8DaeiGl5/67nWHJDCPRyEo
	VWejYiZWZKkFtIBkwN2RpEQ2U22FkS035Z/pDK4E=
Received: by mx.zohomail.com with SMTPS id 1739873001361611.0401794254522;
	Tue, 18 Feb 2025 02:03:21 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH] rust: types: extend `Opaque` documentation
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250212072509.1765360-1-dirk.behme@de.bosch.com>
Date: Tue, 18 Feb 2025 07:03:07 -0300
Cc: rust-for-linux@vger.kernel.org,
 ojeda@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <5D36266D-A5A6-4A68-8CAC-F0C338383E4A@collabora.com>
References: <20250212072509.1765360-1-dirk.behme@de.bosch.com>
To: Dirk Behme <Dirk.Behme@de.bosch.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-ZohoMailClient: External

Hi Dirk,

> On 12 Feb 2025, at 04:25, Dirk Behme <Dirk.Behme@de.bosch.com> wrote:
>=20
> In the discussion [1] some `Opaque` documentation updates have
> been proposed. Add them.
>=20
> While at it, add some intra doc linkage `[...]`.
>=20
> Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>

FYI, I want to discuss this patch. It just happens that I=E2=80=99ve =
been swamped
these past two weeks.

Give me some extra time and I will get to this.

=E2=80=94 Daniel=20

