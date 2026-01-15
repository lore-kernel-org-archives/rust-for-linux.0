Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D972E1EF8;
	Thu, 15 Jan 2026 19:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768504425; cv=pass; b=BPUiWaRBeh0xG9N74P4br9p3mFbY6vLbmRU0HyeojiZGEqvnt/n9DOBLOuncfQUz6QrWo+66nuOL82uIvbaqVBSGhQIK03Jn+u5ZYqk0ujhpFvYqpGsoe6DiH0QaocKgV6dHPxY0G+4V3vggZikqSOH9b4mcYTyxjOHcA8XyW5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768504425; c=relaxed/simple;
	bh=j/0CmqbB/08kp2IlBN5MB/JTMWV1KgRIiZAC9dEu8LE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=NqGVlgUByfUDzKqYB+Fw4fBDDKWqGGTSLYZf1d5ZmZN7dYusMuq8OMT8J83gjLA4E5gr8NjpoHLtNIeCPSHPLjVY/P88xCzOTozhTqO2ZqsfNedA621c+Tk3knqUykpA6qxs4RrbHBYDAyA0X2NRv4i9w8ktKNiHgCdlRdINA24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=fRRbzMC2; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="fRRbzMC2"
ARC-Seal: i=1; a=rsa-sha256; t=1768504402; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WiBAWIefgUSSiYaAxMBbC5d6nzmtorKE1PQI3N6CxyZe3nTv06Suk296ij+5jM9L+ozfZW+HapP0HGEO1ryI1+LtJ5jdMWmKB4PZxmZSOAc36MsOVVKfzwf8fe7sYNiBvA2Rv4oar6Cl0svn4gFgx7K1vxNcZKS4AX4Rn7YfflI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768504402; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=j/0CmqbB/08kp2IlBN5MB/JTMWV1KgRIiZAC9dEu8LE=; 
	b=ZfskU8ZE2OHpeEEdGKyFGeSzSW6Dprmlxipm/uIBs6BzTpJRyc1l6ZgODbfpgn+WgDo0jPT3IggEvvHI6lXsSTWnxpchelZB7LA5iWt/Q8fpqyF5MGawo5CIhrcYpbRtz26Bev06dL3kThiQ93vEGg0g+sqp6C7/jc3w/PnjxhE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768504402;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=j/0CmqbB/08kp2IlBN5MB/JTMWV1KgRIiZAC9dEu8LE=;
	b=fRRbzMC2UArXDcZEk/6K1XZeICNpFY6yWQEW/knN2HQn3FZffX8NisfU02UUO5B8
	ARwwalJiLkQJwwyVhTmJCKo6kemckHiW7AYgCw9IU0F+uwGJPdegqc/CWWlbARFLDLC
	wjRO4pVWySm2fhPsaED8U2NagUwWxStoFPKEbmMg=
Received: by mx.zohomail.com with SMTPS id 1768504400580236.98471969237949;
	Thu, 15 Jan 2026 11:13:20 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v8] rust: add new macro for common bitflag operations
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <CANiq72kaTyiGhp6wP5eecYSSkLGjaOtGmf3gY9hjpz4DOBzdfw@mail.gmail.com>
Date: Thu, 15 Jan 2026 16:13:04 -0300
Cc: Gary Guo <gary@garyguo.net>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Filipe Xavier <felipeaggger@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org,
 felipe_life@live.com,
 linux-kernel@vger.kernel.org,
 Lyude Paul <lyude@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8B248539-70F3-4442-A8EB-33F10FDDE137@collabora.com>
References: <2JpjX5S1c2QLiHUftMzVViS7xatVGkJperCPqxJU8ZQ_Opyo4KPge5jcRCPb0Gcgyxb4yeFhm6Y-1X8q3pbNaw==@protonmail.internalid>
 <20260111-feat-add-bitmask-macro-v8-1-3bc0a558ede0@gmail.com>
 <87jyxjf56j.fsf@kernel.org> <87h5snf4yb.fsf@kernel.org>
 <DFP6YJB8C5IG.3G4CMUM6YN45S@garyguo.net>
 <FD404241-143B-4B24-B8BF-3D121073F4A9@collabora.com>
 <CANiq72kaTyiGhp6wP5eecYSSkLGjaOtGmf3gY9hjpz4DOBzdfw@mail.gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 15 Jan 2026, at 16:03, Miguel Ojeda =
<miguel.ojeda.sandonis@gmail.com> wrote:
>=20
> On Thu, Jan 15, 2026 at 2:45=E2=80=AFPM Daniel Almeida
> <daniel.almeida@collabora.com> wrote:
>>=20
>> The flags may be in your uapi or they may otherwise come from C. In =
that case
>> you=E2=80=99re stuck with a Try=46rom or a manual conversion.
>>=20
>> I think a generated Try=46rom shouldn't hurt. Just my 0.02c.
>=20
> I would say let's land this patch as-is (with the doc bit I mentioned)
> and then we can discuss additions on top independently.

Sure, that is also fine.

Thanks for all the work, Filipe :)

=E2=80=94 Daniel=
