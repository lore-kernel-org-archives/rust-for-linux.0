Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3D323EA96;
	Thu, 27 Nov 2025 13:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764251226; cv=pass; b=MYnKFQqNGNqsR0EKBmasDW8CyqqESIlA4EwhBjqkBzMkbkB6lLw5Of4NcZXskNIIWwAlFea92WgGQOOoVLIEl+sA3Eh4DW8hF73r9AdRunZU8htKeq8YtRg2mtqW+y2T7sFanjn04Mro1b64GM3LJKc6j4IfLK6E4fdtvuTt5S4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764251226; c=relaxed/simple;
	bh=6qoxH9ptgl/aB01Z8akn4v3ycHTrveLcj8F9nGLEK3U=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=qsvjKo5p96j1mUPRUFeOZAb7qy5hY0eeMuhAb7PbfjjLBw2BdRLkNISQeMksLHeHJfEWVrwgUBQDW+QLZFTSOpJsWj83J4WOoTkiAeZirkkaXCeh+EKyYStsXgEW8pzupsgicXJVdtis7ma1rcjZ9cra8B7HSEWCjMWig5gShjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=fQEeq0SM; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="fQEeq0SM"
ARC-Seal: i=1; a=rsa-sha256; t=1764251189; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fVcQ+c7LYCuIMLeDq8/LIEkG+CWZ3NvvwMpbM5PyafjXnBl+wV/wD9oWKkEPgc6Fyh2HOeH2N8IqRNNtFUjp7mAl80w4AP3K3VRsfZcbmvchdwaqcLxLIOsSNlK7ozi/lc20841EHDhn+87hCEl4UjgfxYibOoxBhyJp5NFztq0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764251189; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6qoxH9ptgl/aB01Z8akn4v3ycHTrveLcj8F9nGLEK3U=; 
	b=ZrZFcVMTiFAtXQIPX3NuquQfDjLW85ncMDM1Mh6ywk20uW9Fxw7u2aMA6z7h2LuGvJJ8Z/Bhk/p0ducUH4IqeRY627sFE07qw37wuLKXzhpe3TDzbz9Tp1jWDm6Kbg1B985WfPFfpoM4HfFl2Z1hvFlV2Kyc8ubblY10i+rEr9I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764251189;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=6qoxH9ptgl/aB01Z8akn4v3ycHTrveLcj8F9nGLEK3U=;
	b=fQEeq0SM7mSYTv7fGYjuD+UxpbO0bdqz40nxUPrRYPUWiLNNV2ARD9424BlhEtTo
	STITQYOBJ7l/Sl4SIAXICGhot4wNOVkixGvQQ29Uun7/+WNEshz2BkW/90ZX+uLUZba
	AQZ9fsjOvnj9vOt4S3iAgfoByIpfYpAoZyxYEIQQ=
Received: by mx.zohomail.com with SMTPS id 176425118740252.72308295728919;
	Thu, 27 Nov 2025 05:46:27 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v7 5/6] rust: ww_mutex: implement LockSet
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251127131606.58d86291@nimda.home>
Date: Thu, 27 Nov 2025 10:46:11 -0300
Cc: Lyude Paul <lyude@redhat.com>,
 rust-for-linux@vger.kernel.org,
 lossin@kernel.org,
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
Message-Id: <ECC0425A-8B18-4626-8EA8-2F843C45E0A1@collabora.com>
References: <20251101161056.22408-1-work@onurozkan.dev>
 <20251101161056.22408-6-work@onurozkan.dev>
 <92563347110cc9fd6195ae5cb9d304fc6d480571.camel@redhat.com>
 <20251124184928.30b8bbaf@nimda>
 <6372d3fa58962bcad9de902ae9184200d2edcb9b.camel@redhat.com>
 <20251127131606.58d86291@nimda.home>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 27 Nov 2025, at 07:16, Onur =C3=96zkan <work@onurozkan.dev> wrote:
>=20
> On Tue, 25 Nov 2025 16:35:21 -0500
> Lyude Paul <lyude@redhat.com> wrote:
>=20
>> On Mon, 2025-11-24 at 18:49 +0300, Onur =C3=96zkan wrote:
>>>>=20
>>>> I wonder if there's some way we can get rid of the safety contract
>>>> here and verify this at compile time, it would be a shame if every
>>>> single lock invocation needed to be unsafe.
>>>>=20
>>>=20
>>> Yeah :(. We could get rid of them easily by keeping the class that
>>> was passed to the constructor functions but that becomes a problem
>>> for the from_raw implementations.
>>>=20
>>> I think the best solution would be to expose ww_class type from
>>> ww_acquire_ctx and ww_mutex unconditionally (right now it depends on
>>> DEBUG_WW_MUTEXES). That way we can just access the class and verify
>>> that the mutex and acquire_ctx classes match.
>>>=20
>>> What do you think? I can submit a patch for the C-side
>>> implementation. It should be straightforward and shouldn't have any
>>> runtime impact.
>>=20
>> I would be fine with this, and think this is definitely the right way
>> to go
>>=20
>=20
> It would be great to reach a consensus on this (whether we should send =
a
> patch to the C side or instead pass the Class to the from_raw =
functions
> without modifying the C code).
>=20
> -Onur=20
>=20

+1 from me on changing the C side, Onur.

=E2=80=94 Daniel=
