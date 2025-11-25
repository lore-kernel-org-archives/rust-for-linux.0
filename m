Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A4D25785E;
	Tue, 25 Nov 2025 16:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764087291; cv=pass; b=gvFJJ0cds8UwDc+cMdLZ9LQeLarogYLwQt5XmvGN27zcIaxQQvAutXpIinhz0skK0sJuEASDNCsFRboAkZjPHRo2JnVFrhVXKZANI6oJwQPYe0ApsEFibFpiq50Ax0U5ecc67FfHQT7njbeZj4hYWKIoulIN8XxmcCCLkUOcrCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764087291; c=relaxed/simple;
	bh=gRln37n3/AagnqGZXq/2X6yIPYG3Lnf4BhcgCAy6Fi8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Oo1Tck6y7U2dPD0GA3pMPi2G5my6z2g7DvoIC0nj067UMhB3x6+8ZBAbRLF843qZP6ZNAkcxerlADgBDDy6/pfYPEJO2fIHGZIBYNHh+2CwEXBXNXJtc+LG4BvUTsJ8ysper3JENqInLJMaQ9zFJlECnPsacP+yLVOkNNIZlkIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Y4PKfTim; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Y4PKfTim"
ARC-Seal: i=1; a=rsa-sha256; t=1764087258; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YpjRY0heTUkqPbjwsSz8z2nDiZv35fXJYnWnA3/gHNWKetxwYrjwr20wqukDv4pipWheDIVmPQ3VjwwX7nXyRqFi332oaJCleloKBJQtBFtcq3ZhQNJxsT3Hh3geEDVv0THH2upTnoDTeZZMw3qK0QMM7RCDyJbsWXIepVc8Nms=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764087258; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xg0TNHF1us/4uAXQFbh+hnYRBICTOUNYFUqxRCTZo/0=; 
	b=gzHvLZ2H8HYqeYE0ie6I9CO0QDiWAkvWgRugW8z7iFBcv+BfYr2x4erPl3GlfvCpOiTVSavvt1lsK2LpPGDq1zRO40IFgbyzX7dF8jHKJJ7AAIfHymCyraAzelLBNtOqYDpgWj1pIpMZdZ0S1kzCcwNes7VMLeH0yui2A907OLw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764087258;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=xg0TNHF1us/4uAXQFbh+hnYRBICTOUNYFUqxRCTZo/0=;
	b=Y4PKfTimhfsOS3KtSoZiO8MNQrh+YdVWRxPLGYJiak6ujTJ072B6QuxSlVdFnlNW
	rkNP1MduGe7bISISWpPLbLzFZzGxKRdnxrnCzDpLjs019RFaVPUpCUOZ26jflFZTsap
	+0Url4wiNbkRoAoZ70mrxAz10wdjAsd9UUikVJHo=
Received: by mx.zohomail.com with SMTPS id 1764087253867906.1545255052264;
	Tue, 25 Nov 2025 08:14:13 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v7 3/6] rust: error: add EDEADLK
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251101161056.22408-4-work@onurozkan.dev>
Date: Tue, 25 Nov 2025 13:13:58 -0300
Cc: rust-for-linux@vger.kernel.org,
 lossin@kernel.org,
 lyude@redhat.com,
 ojeda@kernel.org,
 alex.gaynor@gmail.com,
 boqun.feng@gmail.com,
 gary@garyguo.net,
 a.hindborg@kernel.org,
 aliceryhl@google.com,
 tmgross@umich.edu,
 dakr@kernel.org,
 peterz@infradead.org,
 mingo@redhat.com,
 will@kernel.org,
 longman@redhat.com,
 felipe_life@live.com,
 daniel@sedlak.dev,
 bjorn3_gh@protonmail.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A7DC9B39-9BA2-4EBA-B6A3-6153C2942E83@collabora.com>
References: <20251101161056.22408-1-work@onurozkan.dev>
 <20251101161056.22408-4-work@onurozkan.dev>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 1 Nov 2025, at 13:10, Onur =C3=96zkan <work@onurozkan.dev> wrote:
>=20
> This is needed for the ww_mutex implementation so
> we can handle EDEADLK on lock attempts.
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
> rust/kernel/error.rs | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 1c0e0e241daa..9bf1072cfe19 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -66,6 +66,7 @@ macro_rules! declare_err {
>     declare_err!(EPIPE, "Broken pipe.");
>     declare_err!(EDOM, "Math argument out of domain of func.");
>     declare_err!(ERANGE, "Math result not representable.");
> +    declare_err!(EDEADLK, "Resource deadlock avoided.");
>     declare_err!(EOVERFLOW, "Value too large for defined data type.");
>     declare_err!(ETIMEDOUT, "Connection timed out.");
>     declare_err!(ERESTARTSYS, "Restart the system call.");
> --=20
> 2.51.2
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
