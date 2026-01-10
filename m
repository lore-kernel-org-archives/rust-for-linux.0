Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3423E28D8F1;
	Sat, 10 Jan 2026 18:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768068886; cv=none; b=WGajZI4mLiXund6PizVQwDLnpEESqZxIVHnWL1OoFtXs1C5BfbMLiRUSwfTHzMpIVyMsrnymdtrVLSXqq7Qm3LQ3r46T+Gg/wHoDimRVNgPtW/Xav2OIzRNeYIiD6xUzjo5DvVrGsuqpwx+vAy13Nxon+bFj3MhZoEFAkH94B4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768068886; c=relaxed/simple;
	bh=PHsd957NGRRbQoVx9Dkp8Cdv47v+v3PTnATDHyTFI5o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LM4ucysBmO6eSibkcax4IllLiX5t6mgxsZ0m/4znwIEBegzPxzD05WDG0XonBBKm3XPhbHzC15RCZJTo0/4HFbju9yXLmvJ1jXbKv7kJUPYYn+Ha9XhDKSf5KGGHopF6y0ir5IA/5vmlxVdqsDFaW7hnA8RSPo5xyf07qtXkFsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FoWBqP2W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FoWBqP2W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38906C4CEF1;
	Sat, 10 Jan 2026 18:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768068885;
	bh=PHsd957NGRRbQoVx9Dkp8Cdv47v+v3PTnATDHyTFI5o=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=FoWBqP2W4dDOx9OTPbJLLIMAdzO7nRuSKsDRuCXMGL7DQXiHxFvEKsEBlarXj89Ly
	 ohXgc89CnqZ7Ea4sSwa22Hhm5p900zGPM9gRcA6n40fjr5Ex48vFwTMiOmpVs9MLqB
	 prnIVGbUph2Tdr+uUklWdNRk2wBPWHPLarGEVnnqCSatdBEohfruS4TPAaGFIU/hgE
	 vMRUp7svZudAiHWaVRzVcAUxkBlzuN10h+07EMTVCZPohXnBQf8X8wyZIL3hUdmWR9
	 zIaZ8mtSAueDegHKOCd7lM7wXHMZ1p2SNwAZ8je5DY3wFz0dyTraQQelOE1V6P9XIL
	 WXOmM60Wh9Jmg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 10 Jan 2026 19:14:41 +0100
Message-Id: <DFL43YZQJFBM.3D4VE24MIKLYZ@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 08/12] rust: pin-init: rewrite the initializer macros
 using `syn`
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Fiona Behrens" <me@kloenk.dev>,
 "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Alban Kurti"
 <kurti@invicto.ai>
X-Mailer: aerc 0.21.0
References: <20260108135127.3153925-1-lossin@kernel.org>
 <20260108135127.3153925-9-lossin@kernel.org>
 <DFK3R2EK1JGL.FFW73JGUSGP5@garyguo.net>
In-Reply-To: <DFK3R2EK1JGL.FFW73JGUSGP5@garyguo.net>

On Fri Jan 9, 2026 at 2:45 PM CET, Gary Guo wrote:
> On Thu Jan 8, 2026 at 1:50 PM GMT, Benno Lossin wrote:
>> +                quote! {
>> +                    {
>> +                        #value_prep
>> +                        // SAFETY: TODO
>> +                        unsafe { #write(::core::ptr::addr_of_mut!((*#sl=
ot).#ident), #value_ident) };
>
> This should be `&raw mut` now?

Yes, but that involves adding workarounds for 1.81 and earlier. I'll
leave it for a future series.

Cheers,
Benno
