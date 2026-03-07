Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AF22EA171;
	Sat,  7 Mar 2026 21:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772919666; cv=none; b=B3XrGyFHBwIEuSpm7GzuLiMjQG2rbDvElhR2JvscMY62SE94LBjJ+giVEsUqey8LdqjvlX/dEBvU/qrM2NzXRQC98AzG/uIqSa6SVsO7+jYlEAcNs2U1g7fbwuOBAwMX1EIQVicdt8tB8pd48rafOp7Hyg0l9ULLeZGVHvF+0lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772919666; c=relaxed/simple;
	bh=La9CHRdOrLzZLDPTAtAarkgvYs/tV6l4hovAURiSbWs=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=Rz9B1q8oARzNpI7L0+8mMDikmfE5D9skLP6SV6AC64NnwJW6FP8eQVceqQHLUZuTXPNWoQAoYi3IHq8k3/TGvcGtl4ayGxu5NxztExyzZPMii+synGtqfDsPloQEzfFTr28oL1nBjJ8ThoaFE8xYFMB+TjW+LZnRqaEOzliqSpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H95SauM8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H95SauM8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11D8C19422;
	Sat,  7 Mar 2026 21:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772919665;
	bh=La9CHRdOrLzZLDPTAtAarkgvYs/tV6l4hovAURiSbWs=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=H95SauM8cMdRQfmSjJluEq8aC2rl46kqs9CmLlS3flPDGexJ5R4xuif9BMgpdsbV2
	 pZrp5gzJAJQ8LY9vJti5i6kN3kLq4bYGtkwsa+wqufxMOnam3N0RBCtW5c/V7UeSJv
	 RORBiaElmYpn1Z18xNhoDrFmEa3w3v95O2PPcf3WHGKy8JcLZ42wBSsZRdwqA7Kl8l
	 eN/Uuw+K6x+vNiVwwDQ0fcDNaXH5BRi3b5Ek9xuWhfKneyG/1ClMFKfeUKL873VUBl
	 nOK/n8U4i3TcAtmHss+HGbLrhkFQEdhXUVlnQipuZW45KSMJ/viqZZzdiEmWLghvsl
	 1wwTD6KoxVTMw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Mar 2026 22:40:58 +0100
Message-Id: <DGWVKFEQVHA0.2C27PSBYR62D6@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
 <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>
 <DGQ67S1NH3OA.2MS0YVO0UU2E2@nvidia.com>
 <DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net>
 <DGRWZVJNLLH0.39JYHZIIMC9XK@nvidia.com>
 <DGSB81ZE18O1.31CVVHMP38U2W@garyguo.net>
 <DGSBMKY53C5T.3BRV3QI7KOZTL@kernel.org>
 <DGSC6U50TCHF.9FKDO3AWL3Y1@garyguo.net>
 <DGSZWZCI0H7H.2EM8L04YH0YRP@nvidia.com>
 <DGT09KTYDCU8.3BBAZBGIYRGWV@nvidia.com>
 <DGT8FQ97BL8O.1VC1JEXIEBDRA@nvidia.com>
 <DGU4TLDMLFN8.1KKSL2WATFZ7G@kernel.org>
 <DGU7U81KKLCD.2LEPJ73BGLQU@garyguo.net>
 <DGU88IHVRYHD.9WP9Z40UAN37@garyguo.net>
 <DGU92W2W71JI.HBIFK6L78F9C@kernel.org>
 <DGU9AZ43QK6Y.115RDSK0M9JY5@garyguo.net>
 <DGUAC0GJRR0Q.34WBS7BIZ58WF@kernel.org>
 <DGUB44J4FNCA.32QOV1DYI7VBK@garyguo.net>
 <DGUBN1HP1F8I.2RZGSFCBO9FQS@kernel.org>
 <DGUCFC9NJG5B.Z7YUXK4NEE04@garyguo.net>
 <DGVGGGBSC9PI.1TJV2ZAIML0BI@nvidia.com>
 <DGVMXCZGEWV9.41R0TPTD22S1@garyguo.net>
 <DGVNJ8ANGP3Q.1RAGWU2HJGRIB@nvidia.com>
 <DGVO2O009306.GNU06PZ13VA6@garyguo.net>
 <DGVPNC2HE0JB.1HOBJZX8L8XMQ@nvidia.com>
 <DGVQAUVL2SZZ.2TINCJXUIDTCK@garyguo.net>
 <DGVRU6S7WUIU.1OL2CZU2ZUIUO@nvidia.com>
 <DGVT62XLP0MZ.YVAQQ5APE9S6@garyguo.net>
 <DGW40MO7G2B1.27TW3629TLBOD@nvidia.com>
 <DGWUWSDMLCTQ.1675OOTK845MA@garyguo.net>
In-Reply-To: <DGWUWSDMLCTQ.1675OOTK845MA@garyguo.net>

On Sat Mar 7, 2026 at 10:10 PM CET, Gary Guo wrote:
>> But if we can agree on
>>
>>     bar.put(Reg::foo());
>>
>> or even
>>
>>     bar.write_val(Reg::foo());
>
> I'm okay with either.

write_val() or something similar please; put() is not a good choice for
something that does not release a reference count in the kernel.

(As for write_val(), I'm generally fine with the name, but I want to note t=
hat
it also may be slightly confusing as it is the two-argument write() method =
which
distinguishes between location and value, whereas this one combines the two=
.)
