Received: from mail-4027.protonmail.ch (mail-4027.protonmail.ch [185.70.40.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8854918FC9D
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Jun 2024 08:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718353873; cv=none; b=QV18tDY4c0gCW6UWl0ctZGpg9hpDc9MrzD9UI+gtm6vQR10/VBIF9xWG7wXuVjMDZ8yMpUl4kYWmz978VMvx6L7Xz9X8ZuxOah1f/athh4ERa9lvHdtfENuMiSnXE3gFIn3QDIzJTdsX3VN7eTKB6z9K4qbg2fJgZyvTknMOR5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718353873; c=relaxed/simple;
	bh=hAULZUQ/IwjIAy5qteiYqEidYYMjZ5T/deQ04KDtR0A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dFMZ/sm3d0vQpUKv1HcnelRDczOVOsql+qlW+IcbN6R0n6Ss3hq5v+z5Ip7QWhezDadvD/nw1fmcZR5OPpZowJmj4F2pDKWfntxJYZZHUWTen+1I4Dpog0eVqRE9wef+Z19ZkXihtdPjVBC9cSgBdJx0hIM5apghCh9kHDjmQOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=gbQWQ0GA; arc=none smtp.client-ip=185.70.40.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="gbQWQ0GA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1718353862; x=1718613062;
	bh=hAULZUQ/IwjIAy5qteiYqEidYYMjZ5T/deQ04KDtR0A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gbQWQ0GA/T7iWVx3IeQWpoIXhFsDnPBgRWHd5ffE8PORAemDAnDcjG1Ni1PlRGSr4
	 7tj8KO86BB90guQGooyzVvkde0w+bbUXY2RS2uwFTr04hqqGNd4I6yN8CKWGAGi6U8
	 sBTeJGrygcqG4oXuimwTf1/9N2oVFWixIiGO68dG9hBHlgKZwVyQ1rfuFoqevVx8vX
	 cBoGgjPOsnKuoe5S+92RqopEoB+CYGHgYjYXHmLfsQqelCcRARw1wwOlPjrwsUqerq
	 zY3OH2aft5h4PsGSHBd6ZXYulEfIms1lghPfRwI7m9dEAvvPRSq0Kn04bu5tX6qc3R
	 Ium8S2ec9rLTg==
Date: Fri, 14 Jun 2024 08:30:56 +0000
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, tmgross@umich.edu
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch
Subject: Re: [RFC PATCH v4 1/2] rust: net::phy unified read/write API for C22 and C45 registers
Message-ID: <77052e4e-c7d8-4e2c-8bb1-274c7cd3f555@proton.me>
In-Reply-To: <20240614.083206.60448678473106718.fujita.tomonori@gmail.com>
References: <20240607052113.69026-1-fujita.tomonori@gmail.com> <20240607052113.69026-2-fujita.tomonori@gmail.com> <CALNs47vVU-rD99zrGPT2DG9BsAEwQdjVwaBfFx-268TbsEc3rg@mail.gmail.com> <20240614.083206.60448678473106718.fujita.tomonori@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: d5bd43af3f3f555ae00370a9b6b2df65aa60a9a2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 14.06.24 01:32, FUJITA Tomonori wrote:
> On Thu, 13 Jun 2024 12:59:52 -0500
> Trevor Gross <tmgross@umich.edu> wrote:
>=20
>>> Add the unified read/write API for C22 and C45 registers. The
>>> abstractions support access to only C22 registers now. Instead of
>>> adding read/write_c45 methods specifically for C45, a new reg module
>>> supports the unified API to access C22 and C45 registers with trait,
>>> by calling an appropriate phylib functions.
>>>
>>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>
>> This new API looks good to me:
>>
>> Reviewed-by: Trevor Gross <tmgross@umich.edu>
>=20
> Thanks a lot!
>=20
>> It should probably also get Benno's review since he suggested the API.
>=20
> Indeed. Benno, that patchset looks good?

I haven't had a lot of time recently, I can try to take a look today or
the next few days.

I am a bit confused though, why is this marked as RFC? The previous
patches weren't RFCs.

---
Cheers,
Benno

