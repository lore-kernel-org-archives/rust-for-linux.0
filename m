Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE3B189B85
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Sep 2024 08:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727426563; cv=none; b=FqB6fGSYckzh1XEz5VKBluNLV9YaeNo3L+V77obfbtrPfO6rQM8fifF97xdoVzWOZ373cdGped0PIc4k/ZQORatqS/BUMvDd5KhowY1mh8v8V/f0rQuOKBA/sy8hwYy48+j9NnWJYjNuYQv0FjK0eOpeAjXxGwFIQ8zNMoQsSug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727426563; c=relaxed/simple;
	bh=yZwke2t37xHdY+02gwJ96p2eHQGvRgaUIv7a679NMw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CNxRt2MWa+e28Pg/NM05XSR1ZGE1dNNkueWARRUtB61wM1J9F6HYn0lJTEILW4bprxCtMzs/Vo+IQ4sD+ZPzDlPT2ooSHOL4nhaJXgKBI/KsbwsU657OD7UPcnjwBKXWEVJEOPCN0cGhnC9yzyEH3Y3/XmKXCCa0UyjFIm51UQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=E8SOA95S; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="E8SOA95S"
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1727426549; bh=yZwke2t37xHdY+02gwJ96p2eHQGvRgaUIv7a679NMw8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E8SOA95SC0hpmoyPFosn69Lq/KpZXWU6qryndQ5OcblfZWMXmRUteRvO9eITJNZCW
	 7Ug2Y/IDSxTDAb2ZKhhreXnt4EgBVpUqkVIJH3iaMOIiKZL7/zJffw6BWjbe69jmeB
	 5sgd0vh/GONpjHiBDQQ+PSlRV+NZ1hnnS+CTonV0=
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Benno Lossin <benno.lossin@proton.me>,
 Nell Shamrell-Harrington <nells@linux.microsoft.com>
Subject: Re: [PATCH] rust: types: extend `Opaque` documentation
Date: Fri, 27 Sep 2024 10:42:28 +0200
Message-ID: <184D5CF5-7734-4A48-94F8-0419667AD5CC@kloenk.dev>
In-Reply-To: <20240926050015.3216641-1-dirk.behme@de.bosch.com>
References: <20240926050015.3216641-1-dirk.behme@de.bosch.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable



On 26 Sep 2024, at 7:00, Dirk Behme wrote:

> Update the `Opaque` documentation and add an example as proposed by
> Miguel Ojeda in [1]. The documentation update is mainly taken from
> Benno Lossin's description [2].
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Cc: Benno Lossin <benno.lossin@proton.me>
> Cc: Nell Shamrell-Harrington <nells@linux.microsoft.com>
> Link :https://rust-for-linux.zulipchat.com/#narrow/stream/291565-Help/t=
opic/What.20to.20work.20on.20next.3F/near/467478085 [1]
> Link: https://rust-for-linux.zulipchat.com/#narrow/stream/291565-Help/t=
opic/What.20to.20work.20on.20next.3F/near/470498289 [2]
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---

Reviewed-by: Fiona Behrens <me@kloenk.dev>
