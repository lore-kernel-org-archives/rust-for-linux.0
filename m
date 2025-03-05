Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9D224EA94
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Mar 2025 14:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741186080; cv=none; b=Djq3chVGg6QZ5IXFZKOl1Rbm6uvw9RMmPT/V9761nxs0M+9m35cv4NggXXegkucJDVxgXd/HMvjQ9qz16vIJtTCKWWqHMoVfLp1Qm0LPkVVxf0FfqUm5Ct1J1+n9b2AUogax/XNq3CBONf1YuDz+jdTNPRSFjfLCNdZ9mjRz4Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741186080; c=relaxed/simple;
	bh=LOHoKOwaup2T7fgqEZzkw2MRjS/dLi+J9/ocOWwmiKI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G4vCFudL2h4WK4ivKi01pfgMVZm7zPsZd93UOcmx9Ach6TGzXxiymqnSQfdM77g7k36zN43Y2FMbxBPhqUwZDNN/NF/s+S2RAvLoLZNEclB2LVOQK192+SZesco//kqKZ3GAgipwsNOnC0Yhkdbpu+33SfoclywePKz+rtMJv7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=NlatyoR6; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="NlatyoR6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1741186076; x=1741445276;
	bh=LOHoKOwaup2T7fgqEZzkw2MRjS/dLi+J9/ocOWwmiKI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=NlatyoR6RfyPMDtYa/Kc/aFiVr3F0FVZS5FCG5A2JuVfDPW1OsVVZ5oXsghSDsdc/
	 UM8GMNrnV0P2yLBuVHpnS+LS/HX6dbsuJLNLCaja/UcrhSMu3vImzAFkkz+Da+2kdf
	 2wW0XSsoetx3UFKMMrpQ+/fVPgv5nM7AMMt3t/3004Tfr7hEromeRE3SNWCn1gslLX
	 Rmdfho+15jsFLq5dq4ESfS6SWlo+9c1aQ5dNJTxqsB3ZXU9IN7gtfB37MezWut9kiX
	 HRD85o2UKhvo6kp9BAppzCNnj9GEyVGYTFxNcfUyKjoo5PehikCdnAv6494C+g2khn
	 7AwAmXorsBxWQ==
Date: Wed, 05 Mar 2025 14:47:50 +0000
To: Andreas Hindborg <a.hindborg@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 00/22] make pin-init into a standalone crate
Message-ID: <D88EY34HLQP7.Y6Q7DWM1I40Q@proton.me>
In-Reply-To: <87r03b8rzc.fsf@kernel.org>
References: <xn5HRPkxO91lsoIUAwMnnAvQRCAgmw6nzTZX2DsODS0viAvz_g6B8l3dpYNtcL2jBXySi0DQrVi04b6MY8GbMw==@protonmail.internalid> <20250304225245.2033120-1-benno.lossin@proton.me> <87msdza8d5.fsf@kernel.org> <Hlq4P8qcOOmwdtlEQS7tg0FifI_i0ln9dvHP04yyxWteSpGAV2OUnP6ahOqX85eohzXVLSKdBak5guQvYfospg==@protonmail.internalid> <D88DZV6T9WOV.1QM9UZEAB6IL7@proton.me> <87r03b8rzc.fsf@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 59dfe874c8ec9a93942e0e2abd07faafb916a1f0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed Mar 5, 2025 at 3:36 PM CET, Andreas Hindborg wrote:
> "Benno Lossin" <benno.lossin@proton.me> writes:
>
>> On Wed Mar 5, 2025 at 2:56 PM CET, Andreas Hindborg wrote:
>>> Hi Benno,
>>>
>>> "Benno Lossin" <benno.lossin@proton.me> writes:
>>>
>>>> This patch series extracts the pin-init API from the kernel crate and
>>>> turns it into a standalone crate used by the kernel crate. The reasoni=
ng
>>>> for this change is that the maintenance burden for me is too great
>>>> maintaining two (more and more) diverging versions of the same library=
.
>>>> At [1] you can find the user-space version of the pin-init library as =
a
>>>> Rust crate.
>>>
>>> [...]
>>>
>>>
>>> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
>>
>> Thanks a lot for the quick reviews and testing!
>>
>>> Tested with downstream rnull driver. The driver is 71 patches on top of
>>> this series. It required a handful of trivial changes to patches that
>>> touch pin_init, but everything seems to be working just fine.
>>
>> Do you still have those trivial changes around? I would like to know
>> what kind of changes you had to do. Was it just import adjustments or
>> did you also need other changes?
>
> I pushed my branch to [1]. I folded most of the changes before I got
> lazy and put a commit on top, so you have to do a range-diff with
> v6.14-rc1..rnull-v6.14-rc1.

Thanks! Those changes are what I expected.

>> If you find the time, I would greatly appreciate if also you put your
>> rnvme driver on top and test with that.
>
> I can do that, but I have a few work items to tend to first and I go on
> PTO next week.

No worries, I think I will have to spin a new version anyways.

>>> Reviewing this series made my head spin. It must have taken a
>>> significant effort to compose the series. Thank you for making that
>>> effort!
>>
>> Yeah it wasn't easy to get the two versions on the same page again. The
>> hardest part was to split the changes into self-contained patches and
>> also to ensure nothing breaks between them.
>
> I checked every commit - nothing broken for me. Very impressive =
=F0=9F=98=8E

Thanks!

---
Cheers,
Benno

