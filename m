Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831C0156E8
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jan 2024 12:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="WSFNtJU2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=2g5ebz5ivbfhtnpdlttoqfuvce.protonmail; t=1704975472; x=1705234672;
	bh=B244es5wA5aVTiIC12KCwoXZhtYYZCgIYCXTFXwVJ1A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WSFNtJU29SwtPmRjG1BFPf9Ht9BtUvuys1mm/wm47MnG5zg+iUvkNegWDi/ywJqGX
	 QbyGcaLBO1TXPWpCXJXV2mFxoa+fMmY69ZeKhG7wgFlDrHe1ntSXJKaw2LGTVaX1E9
	 CbmizCRhxoJwlJJqiEOkndWNX3zpUnuopvMdiLFUaETDtd5e8q69cC6w4ESEgwDlZQ
	 31h1wqCVXE4UxyODLo9IKsht6rrGbPOmIYjkFkZBCh59yahMhdiSovM3JSt3t6QHkN
	 lYUlj1/k3ZXMgyI6oFRPLix1erSR5w+7Lr4XG45uWJZE2v6P6UJzClgsiwneh23twU
	 DFxSOlLnNIw2g==
Date: Thu, 11 Jan 2024 12:17:35 +0000
To: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>, Greg KH <gregkh@linuxfoundation.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] [RFC] rust: error: Convert 0 being an error to Result
Message-ID: <2024f8b1-eef2-4666-81e5-a8bca65afef9@proton.me>
In-Reply-To: <36117a36-18e9-4961-8761-ed32f8cce02e@de.bosch.com>
References: <20240111064415.908487-1-dirk.behme@de.bosch.com> <2024011114-tartar-jimmy-9e0d@gregkh> <4b2265c7-3ef3-4bca-8237-3752d2915c0a@de.bosch.com> <2024011108-shortcake-underwent-e12d@gregkh> <36117a36-18e9-4961-8761-ed32f8cce02e@de.bosch.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11.01.24 09:14, Behme Dirk (CM/ESO2) wrote:
> On 11.01.2024 08:54, Greg KH wrote:
>> On Thu, Jan 11, 2024 at 08:29:06AM +0100, Behme Dirk (CM/ESO2) wrote:
>>> On 11.01.2024 07:59, Greg KH wrote:
>>>> On Thu, Jan 11, 2024 at 07:44:15AM +0100, Dirk Behme wrote:
>>>>> The existing to_result() takes a (signed) integer from a kernel C fun=
ction
>>>>> and converts it to an error if it's negative. Additionally, there are
>>>>> kernel C functions returning an unsigned integer where 0 is the error=
 case.
>>>>> For example gen_pool_alloc() and friends. Provide a mechanism to conv=
ert
>>>>> this to Result too.
>>>>>
>>>>> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
>>>>> ---
>>>>>     rust/kernel/error.rs | 10 ++++++++++
>>>>>     1 file changed, 10 insertions(+)
>>>>>
>>>>> I'm unsure if something like this is acceptable. Therefore the RFC.
>>>>> But I want at least ask ;) In the end this is a slightly modified
>>>>> copy of the existing to_result().
>>>>>
>>>>> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
>>>>> index 376280b6a745a..3306b8f590866 100644
>>>>> --- a/rust/kernel/error.rs
>>>>> +++ b/rust/kernel/error.rs
>>>>> @@ -248,6 +248,16 @@ pub fn to_result(err: core::ffi::c_int) -> Resul=
t {
>>>>>         }
>>>>>     }
>>>>> +/// Converts an unsigned integer as returned by a C kernel function =
to EINVAL if it's zero,
>>>>> +/// and `Ok(u64)` otherwise.
>>>>> +pub fn to_result_zero(val: core::ffi::c_ulong) -> Result<u64> {
>>>>> +    if val =3D=3D 0 {
>>>>> +        Err(code::EINVAL)
>>>>> +    } else {
>>>>> +        Ok(val)
>>>>> +    }
>>>>> +}
>>>>
>>>> How would this be used?
>>>
>>> One (randomly selected) usage example:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/x86/kernel/cpu/mce/genpool.c#n107
>>>
>>> node =3D (void *)gen_pool_alloc(mce_evt_pool, sizeof(*node));
>>> if (!node) {
>>> =09pr_warn_ratelimited("MCE records pool full!\n");
>>> =09return -ENOMEM;
>>> }
>>>
>>>> 0 is normally not an error, why would you
>>>> need/want to turn that into an error value?
>>
>> So you are treating NULL as 0 in rust bindings somehow?
>=20
> gen_pool_alloc() returns an unsigned long.=20

Why does it return an unsigned long and not `void *`? I looked at some
other usages and I found several cases where the result is immediately
cast to a pointer. Maybe it might be a better idea to just change the
return type to a pointer type. If that is too much work though, I would
recommend to first turn it into a pointer on the Rust side and then
use `NonNull` or something similar like Trevor suggested.

--
Cheers,
Benno

