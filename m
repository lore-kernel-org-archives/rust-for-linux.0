Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F61117B50F;
	Sat, 10 Jan 2026 16:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768062097; cv=none; b=BLcpMJZHL0rswGuACyAhGg2aNtDqgMPvGjHH5hpEHJd+MjHEuNSo0hkAmDEgU91dxrKwnz3yAcuG+7x9ChL/xJzTatkyPBPWwhe9qJy3YJEC66RUUq6c+LGtiD7Na623mJkCtsDEmx5vUjQM/n8gREhp1OX7u0mWi97yMetKDNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768062097; c=relaxed/simple;
	bh=3fkYY3868y74W5QAgM3BMAu9NwJz6GqaK6uhAg0A3OA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nSWAxFDpd0FvQtCmk2/DcVTtRCe/2lxaG+B+iW2K7KFfrXNzn/UkRDlKVIUAbrL3jmyz/l+IJ+hPUllCE1sqPSPvoVZgzj90BPmHI33nySCDSonukTI7FCZI06Y9dAVuPj/ju/+E975iydaBFsb4gvdSCu/yvvJU3Hu6Jf/2ous=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NM4Y7loR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NM4Y7loR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD50C4CEF1;
	Sat, 10 Jan 2026 16:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768062097;
	bh=3fkYY3868y74W5QAgM3BMAu9NwJz6GqaK6uhAg0A3OA=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=NM4Y7loRNESkgko8tBBheVDwGtSQBUlEmQcAPH6lFpJIgFXQ9pdtDcTfwXiDtw1cc
	 n554ieoF3j1G3fYD+jtAbY/xMYHaMQuyEC4F76Cv4FnSGzfhJJR8soBW5mrNveCKVg
	 0C9dfzCrWZm8vLpKutS6Xs+xkkSMF8kl+pgxHN6O5mPvWeYIZOagoiyWNvbRzyVXlg
	 6YQ/Rtsi3+6IXxKJFbqMqSfOpVMxQE6B4egpvXume1oA24mU6+RlfGIfwQNy6R+G6m
	 EA9DxVt5afDccAEk5efi5ej/ZsoNfgpTOOTK/C3YaFtvxzC2e+/sj8x0wK1Gj5BLw4
	 //A+3RC26NDKA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 10 Jan 2026 17:21:32 +0100
Message-Id: <DFL1PC40HZIU.3V030UQ1DWXFG@kernel.org>
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
 <DFK8F3L2BMS2.3G1BAQSU145IH@kernel.org>
In-Reply-To: <DFK8F3L2BMS2.3G1BAQSU145IH@kernel.org>

On Fri Jan 9, 2026 at 6:24 PM CET, Benno Lossin wrote:
> On Fri Jan 9, 2026 at 2:45 PM CET, Gary Guo wrote:
>> On Thu Jan 8, 2026 at 1:50 PM GMT, Benno Lossin wrote:
>>> +                zeroed =3D ::core::mem::zeroed();
>>> +                ::core::ptr::write(slot, #path {
>>> +                    #(
>>> +                        #fields: ::core::panic!(),
>>> +                    )*
>>> +                    ..zeroed
>>
>> Would just ::core::mem::zeroed() here work or does it have same inferenc=
e issue?
>> IIUC the type inference should work here as ..Default::default() works.
>
> I haven't checked this, will do so.

I checked it (also in the kernel) and it does seem to work, so I'll
change it to your suggestion.

Cheers,
Benno
