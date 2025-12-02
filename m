Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E21E29AAE3;
	Tue,  2 Dec 2025 17:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764697454; cv=pass; b=TbPq6gjQZ5VzhP1UQ65Q9Hu+zW7oCPxV8H2Eczdse4of9uhbLHLAvW5/4W/9/GxkSx9ymdSWSmZfR9h4XsOI7LaJrHw7IHairRaeQ9JJkSYqq+NwDPeAF/nvXTX7hu2QmI66ly4CBoIG8OKKVoFI9Ybq8pclMohTj1udAJxa9G0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764697454; c=relaxed/simple;
	bh=lm/7i8DDI69ZKlLc7iw4wjH2diEXnyqjlHV6BCum9dw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=tM57i7pQSpXEnFSuyAIxQj2UEvAcHaiimb+lafxna272mdqiVEtAgOdxhu5Q5PcNdf+pCQUwJdz5oRfa032s0m2IJbuAOong9FTEfz4i/pGxou3bjZ5lqEjUyJZ4BvixMgbuzfdMVqGuWLkDeRif0zn3N95CYT43A4J6DoF+zW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=GI+h0EU9; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="GI+h0EU9"
ARC-Seal: i=1; a=rsa-sha256; t=1764697429; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a8wnChRfOmfC3eh8QgKZwtYoAhjFs5ee8od8ZrmuqYC8ZpL0wnESBMSdPm3d/+eZQjwxtj6tEezZmV9xd4Wr+AcEUyHGTwfCEZ8NxoLHCKC2ZFWqnDl/Twh8bGIzgJBqvwq2llCs5tEPiZb+p4gJjIq+FQgi8b6QPQse8VRvR8c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764697429; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JmTCvTv2cUfV158DrU8QJjd1iMLkbD+ur+WnnL1GxAY=; 
	b=CZH2qPB1FX/ZtQZQ+k/5SqjMbLxXishbtD2h/d7xFuhvNDYA19A9qGiKn+0pi3zcQJIUfMKTJGjTBmrmw+z12lDroNz8lPEz3rX/TDwAIs2rDikHUbc9ies72MEkdQeBSO/4H5WybTvr4tYUiqbEZnhq7o4Zcwkjh9MgPEGnw2Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764697429;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=JmTCvTv2cUfV158DrU8QJjd1iMLkbD+ur+WnnL1GxAY=;
	b=GI+h0EU9gT8/W8gx44YkqZ/VMfgLaPpbSza/f4a2hFYReZkHzWDyDPcdfIWJAyq8
	i5DTdG1StPL1dS1tpbpftpmHXXijS0qyBkLVJA4iXLRe7KSn41poyxQrjW5uayb1bc4
	OwBbB1YVOXavt+XJtJV3P1pF+iFfzOyA7Ma19T1Y=
Received: by mx.zohomail.com with SMTPS id 1764697427327151.8321313680649;
	Tue, 2 Dec 2025 09:43:47 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v8 3/6] rust: error: add EDEADLK
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251201102855.4413-4-work@onurozkan.dev>
Date: Tue, 2 Dec 2025 14:43:33 -0300
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
 thomas.hellstrom@linux.intel.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <74472BD4-5968-4B54-ABCF-EE0D939F15E3@collabora.com>
References: <20251201102855.4413-1-work@onurozkan.dev>
 <20251201102855.4413-4-work@onurozkan.dev>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 1 Dec 2025, at 07:28, Onur =C3=96zkan <work@onurozkan.dev> wrote:
>=20
> This is needed for the ww_mutex implementation so
> we can handle EDEADLK on lock attempts.
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

FYI: missing tags here as well

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

