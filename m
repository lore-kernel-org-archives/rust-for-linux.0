Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD501625;
	Mon, 16 Feb 2026 14:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771253215; cv=pass; b=W/Kx37HV1es6vjkCqaQtfS6bt5P1XAtpB5k9WcF1n7DwkN7farVw/PLy6RyDk2CAt7tr8g6F5ULpeFdOS0JMHfWv9jb9Ogu7EVzYtDsOV95qceIw+1cyEW/W1l+EedRNe+UkX0XoypKxnKePfxAiHsfu++EbBe/SnfOoAqXGWDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771253215; c=relaxed/simple;
	bh=7vWEz3AeLqypi+UVoCEYVwxFYFOGLcwomsjXtNklxic=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=imacAAAzRpREV5L1F8rkxEgnZJU1cxjBvKHXDpsfJd847Z3Ml489WH5dDppon+2ICy/J16qOiu+OZTiWWKLLOAAgM4uFDe9mcjCL2zRcpfLdo2wr58LnoJRPmUaY2C+hHLhotFGHCNiQAiLt2h/n57+xASpz8BWZW59QPSYC1Pg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=JsBMPY8m; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="JsBMPY8m"
ARC-Seal: i=1; a=rsa-sha256; t=1771253201; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZaKNrffTv9mn4k63zKRxagAiTR3f4ZyjNIgN4wJhMW+xv3/1GH/JGnQQnd1yHL/e1mcFTM+krDp1qQkomROr12IUZlI7dA4zdlD5LM+4NinjVJzsUrJ/ZDdPY89XOr+812v63xRDIxz5touj6068meXymTWYiTGaQAyelrUnxto=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771253201; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7vWEz3AeLqypi+UVoCEYVwxFYFOGLcwomsjXtNklxic=; 
	b=jH/wq1SUIcftLii+j2yw4bx/Y0xk+tBNhivGzOScf0ovHN9wxoT5Bt+fHAnTDqhRejs8v3cWIaLXoX7b9q0ILhTLVGmF6oQuc7/zVPz83EXFQVRUSQ6AoCqWICgrV3YA/1E+leWT8OszYegp/1yOGD7zEYFX7NurYz12HEXGNk0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771253201;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=7vWEz3AeLqypi+UVoCEYVwxFYFOGLcwomsjXtNklxic=;
	b=JsBMPY8mMaUYH1uHYqW5XqgKwT1lif6v7MScGPrhXkyAlyCHk531XvQDqpWjH7BT
	HFcySh7bRsAY+VB12NKUaMHrBvnRY+RdyDEbU5R62JQr4YGQS1MJE2lJJaAsjYmlzM+
	SvDCZpZ/bbGqhUGER0P4Dm3ImqtO2s5KpFA5BYdw=
Received: by mx.zohomail.com with SMTPS id 1771253198903262.9112170618437;
	Mon, 16 Feb 2026 06:46:38 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] rust: add a ring buffer implementation
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DGGGPFU9E9VD.8TT3HZUWS100@kernel.org>
Date: Mon, 16 Feb 2026 11:46:20 -0300
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <71F89D79-DBE1-4617-B58A-8552D0F2B3A2@collabora.com>
References: <20260215-ringbuffer-v1-1-9b359758a1b6@kernel.org>
 <8tULWyvUTjVb3E_HFZeW2maApI87eYLZungGtJ6k9CVT9J-C-TzIqx5ShmHA5vS30yqZRq7TmaBd0AIg5V7u6Q==@protonmail.internalid>
 <aZMMyJofDKualqXw@google.com>
 <873430es2p.fsf@t14s.mail-host-address-is-not-set>
 <C82DE0A6-17FC-4FD9-A272-257B59129A7E@collabora.com>
 <DGGFZX5JLZ22.3E1C8OVLNUDD6@kernel.org>
 <3D7C5FE8-CA15-418B-B2F7-D0EA4C37E1F0@collabora.com>
 <DGGGPFU9E9VD.8TT3HZUWS100@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 16 Feb 2026, at 11:39, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> On Mon Feb 16, 2026 at 3:21 PM CET, Daniel Almeida wrote:
>>=20
>>=20
>>> On 16 Feb 2026, at 11:06, Danilo Krummrich <dakr@kernel.org> wrote:
>>>=20
>>> On Mon Feb 16, 2026 at 2:45 PM CET, Daniel Almeida wrote:
>>>> With the allocation being handled by a separate component, I =
don=E2=80=99t think
>>>> this is right. I think a better location is rust/kernel/io
>>>=20
>>> I'm not sure it is reasonable to ask people who just want a =
ringbuffer in system
>>> memory to take the indirection over an I/O ringbuffer implementation =
with
>>> generic I/O backends choosing the system memory I/O backend.
>>>=20
>>> The proposed code is simple, without comments and tests, less than =
100 lines of
>>> code. The I/O infrastructure to make this happen is still WIP. So, I =
think it's
>>> fine to land it as VecDeque for now.
>>=20
>>=20
>> Well, this is a 100 line patch, but nothing was said of how much else =
was going
>> to be added on top in the future. In order to avoiding iterating on =
what I
>> consider the wrong approach, I suggested that we start out in the =
right
>> direction from the start, something that Andreas himself apparently =
agreed to.
>=20
> I haven't seen any commitment to implement this in terms of generic =
I/O backends
> from Andreas.
>=20
>>> Once we have the I/O backend infrastructure, a system memory I/O =
backend that
>>> can deal with separate allocators *and* a ring buffer implementation =
that sits
>>> on top of it, we can still revisit if it makes sense to take =
advantage of
>>> synergies.
>>>=20
>>> But for now this seems a bit premature in terms of delaying Andreas' =
work.
>>=20
>> IIUC, and feel free to correct me on this, the I/O backends are =
already in the
>> works. What is missing is a trivial system memory backend, and =
similarly a
>> ringbuffer implementation, which is the subject of this patch. I =
don't see this
>> as a lot of work or an unreasonable ask.
>=20
> I think you are highly underestimating the consequences of this =
design.

Might very well be the case, yeah.

>=20
> First of all, we're missing IoView (the generalization of IoSlice), =
which also
> supports projection. Gary is working on this, but it is completely =
unclear when
> it will land.
>=20
> Second, the system memory backend would have to be implemented and =
needs to be
> generic over arbitrary allocators. Also note that I/O backends do =
*not*
> implement growing and shrinking of the backing memory, which would be =
another
> limitation for a derived VecDeque type to swallow. Alternatively, it =
is yet
> another thing we have to implement.
>=20
> Then we have to implement the I/O ringbuffer type, which, due to being =
generic
> over I/O backends, also has to consider the device lifecycle =
requirements for
> the corresponding I/O backend, which is additional complexity as well.
>=20
> So, don't get me wrong, it is a good idea and exactly in the sense of =
my vision
> of how powerful I want the I/O infrastructure to be, but for now, I =
think it is
> unreasonable to ask Andreas to wait for all this.
>=20
> - Danilo

Fine, let=E2=80=99s stick to VecDeque then. =46rom what I am reading =
above, there
doesn=E2=80=99t seem to be any naks for a more general ring buffer type =
due to the
current patch; it=E2=80=99s just not a good time yet. In which case, =
there=E2=80=99s no
complaints from me.

=E2=80=94 Daniel


