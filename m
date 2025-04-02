Received: from sonic302-21.consmr.mail.ne1.yahoo.com (sonic302-21.consmr.mail.ne1.yahoo.com [66.163.186.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB88F1F0E2C
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Apr 2025 13:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.186.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743601971; cv=none; b=i7jGffYBUOcUhw8zMpvMxURqsv+uUlssg08tIi9eAQnopNHPnuxcdqfPYk/GO+3WS+AJrtW+af2rDJAe8te/7e3TQYJ11FseKwFaEd9WY+mEy9QW9TQH4qbi7yPmU9gJDdSjNMu2X3xGj/G6S/+TCXIhvgm0hZlJZH/EpQ2nPCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743601971; c=relaxed/simple;
	bh=lipHkSOi3h356FBXqs7ScOA6Ih4jLc9BhCEACpR7Yw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aj67RwlRcvKmzLt8/jJwlQ0eW3QZDUqJO/Hy3vrM+F5qfXwA1p1zjzAld7+vP0wjrVozTZECZ0zHr7JSaQAKIXWAZlmwnNMft7ec1JJrJ4S1XoydVcAODIDe9p9NJg2M/+zKgWoDVR5bU/yTD6UG6o50d6blvUc9tdJI2o7e91U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=rBZnBBW+; arc=none smtp.client-ip=66.163.186.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="rBZnBBW+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1743601963; bh=5qCXny3N92aeQsJHD43bwMFhPLx8y5+HLUHDF7Zp/cc=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=rBZnBBW++qibZEAbGsAiU92/j7BvWZNCaeAkXquoGyIhi7MynTO+1C6GQdwxEFzpSoQl9E6Z+q9+GxDKoJqrl1tU8J+EX5hgq0y6kfeMCoTe+4M3Q+iKRtzm0lPVhgazQEg7k55i2uaDrw2oy0XNSjy5A5sSjUgOfjHoFqSfZnJEwPytPAO5fdU0NunNlrs9r2AnFi1c4O+1Ti0a27YfdaAPBBoL+vgtlsKFu5w0Sr8mJ74HxSdYm5s+ETBDUHRkvnS1rpsNpkv6et+ElMppDwx3n/j7TdxLfi4L6i8GkrQy/pZY2QxooV2U3KQhfKUbToMUXUyu7a/6LbstaXI6Jg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1743601963; bh=LL3G/zmuIUgsiorgTQ4LiBld5fWfRSkNLCuaGYLChB4=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=mS9RcdvVsfRKcaiXl61dlAq9QLXLat/XdDZRsZaPiyhSTazqw84V0KpXOGASgSUxU5jrzcIEOXr47V1aF1qaNqJDWM4C/3OI1IPkNhCb+BItheZ98Z00sKco90bX/cSoX7AVDmjzs8qTHnl5qIwbnCFxU8cYW77mwgveGam05oK3qbwft96/bOoMJREnJKHrVzlJWg5ias+ho2sp86wkPkuq6dgvkYPr11ynupFYIaMuxMn0tFeSz5gj9UtAptd+ZJ8Puw2fOQlZF/DnbVFQ69u4pCIDnJYv3kS/vmMAwXsEdfNdNO3/aClK30AtCcFDKHw7p2yxCyJcXw2LoC4vcw==
X-YMail-OSG: fDXnA.kVM1l.C9zCZCFIe5MtofnaDyYA1z.zDJQbNoD.XHY009WkzdlY9o2evy.
 NynHd4lJ6X41e_jVkri1UclLq.Gzpdqfkt1UI39ThDCgfKZTWnmfgeYzI48MtYn7iiMwT1qcugqs
 zrCXIefCUGvJHIFhQM4Leccc5NQikxoQgYHSuIUzJd1SFcAQshFk8wlr1Lw_jBc9ZMzezbIPJJCd
 VyowSSuYHYOCPuJ1exmaQll3B_NK5Llelkwl_q78fMZX_8UlhEIYSeC3lbgboE1EEw2Oe8ba1XAt
 LjuyG1sajx_RcD4qlIbZAG.li6Z_b9DGehYDPKNVp3kghS.026JbmskWU89jALoFA57IORFNUPRJ
 uLnBmvp0K_xSReSI94j2UCmZbeLUlVi9pxd_pbGkZHtLTpAViAFJ1YI92P7DXcnHDhAReDSQYrqy
 ddfEaxjF40FllHDv6nrUVjsVXx5Ow7oswxpzdbn_yI7pxNUScHxpbkqqN09KdeCFm1SmAUWI3mGq
 1LJr.zhTEcEdQiwHIOqfbQaU4r24qbpXqBhoqXpFd6U.BhbBn1X6WMsFTvmzJLAWkL0C1WJMSvb4
 w3qYavpFg5mQrraIkxHyGJJIFaTxT0MvdjXUNqqevvC.yphGgn1fWAl66oXmCqnRgumbtlbLwG8w
 H7akLN7b98wWZt9CXYyZode.D0hIS6jy8MqyuCvZI49BCsM4SuO8Uv05bFePsXcfK0eY_.NuYKGH
 Oo7uDZYq.IjahMtiDxaZDQXCdeKbqPxRstJEUHxxTpVZljPn6Pt80ITg92LIEb9IjeZQS.zKwGfW
 aRYp4yvcEDRSWvH9Yl6nBHSCJ6FZIju4WqfDcL7WFtSl6co5_nXgRR_dOQnbiwMxM8MXcaom3MmJ
 S9BP1Td7jQj.mGjYo05QDLNXI_01vq1jthsIldN8oErS_fF6Sce6eG1DRChtySkfyzNZZ9yIzMW0
 SNPcEbvKXipujW8JUtxIm5ITJXpjbRS5amLxm1NM5ePaF62k1cVl0fdw15stTOe6L7uovk.f4EN6
 ewddKFiRM00Uzrb9XNt6jG61cTQBAO5LegnZM1VueXFXTbu6IdJ_xj9FxOmMEz3HZbmuzMNADrT2
 9R7D8Vbk3fuszsWJiM0qVz9IcTMq3xErT0qazWoQgFMRoUZJFTidbzLIPeQ2nmZ4I5iOnxCTswdS
 7gtptp_.I3CJ0u.2VEXbTP72Ggz0LJfh0eSTwE.CT0pXnZa5gYk66SvyBXqphkt2xiPnRKTvYDJz
 bDA.wY614odmcJ_.fmss1J5mc_if8L3acWiD3KAAigA77T3PTTUJio5BT9b.U2nvBvFYvmCZkH0i
 _bRJTg2pBlpV5cmiEv5dcYiTqixuYM6bTBJQqE2pBTemvZxnBW7_zJki8SvynB9XXUyo.GGUExs_
 g71b.7ScPYI5iBrg.COn9MrQ.F7rSUqAUqiKl.wZqCc4xVESAY_29Yex_Ix_r0_NTCoKW2jTDnIs
 lOSPiZqMxUFi0XF6IbZMw5a8DFBEFPuBf_5htyz7C3TiPwu.uJXeUNZYh9yrayRJESk_EsEbD8GD
 98x2uGCVy.auBoFe31Kx.BsBdhdbeYtdnSGAYhZ9qTQDSjf73lhBfW80sawC4cxYUNwYR3Y.Rahb
 bfHQ1zxERkQyB5Nw9uWWZyKVxlRoSFkEWf.UnLsWGA_GqWXa3lTj01bKcqqnTW4DchXwtuCNdyep
 m37ODHD5ev.rfVU1TaFAbN1bK7zOiHbk36cpoiYYPVta_Sg3lqhwm.a5CAFdYei7aSc6_VGsjtGQ
 kGbvT1kY_9jL.ytuw1j.R7wcb.Sj8C_iKbKPBDOzoYnCisSBzOJjma8vwqdYBF3NCxZ0cO_sROAw
 PR8wbqPSyOzKizn3h1K24LYPhhWsnobxF6UfxnBAugCIWn_rqctf2n_wn_W.bFlI5NS1UIsrdXFk
 1Fy_TLGZ4fp.3qgQvOOUGNOEB65Fn6SMM9OJckhp2UhyLg4lpjk5nhrIT0U7mFItpMc39POoGKkO
 2RbWKyaWfxx1gXOOAYGg09dMtkXVoMGtZHBhjE9srtkyHVaG_7p0eTXZe7kPCBsibtvvwiVhWAG.
 V2qaQ8UAUWuoaobemBUT.bokAJCy.QHqvnKduCRwxffoMxGse7XWB8xztyDNkdqgtL1H3VaUFJLY
 jCWxmkuIR2LgpJluwz3h2NIM0wEnUJStfygSQxkv2zNorT5xxFJTm0sECUwXvfhzpKV6gXDoUYbf
 SSq3I8yu1xR23d5jWIB_bXZ2uR33jVjfRP1CkRkg3cjr98EQ-
X-Sonic-MF: <igor.korotin@yahoo.com>
X-Sonic-ID: 9b42be02-0921-4497-9953-cd2dd3f3de2d
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ne1.yahoo.com with HTTP; Wed, 2 Apr 2025 13:52:43 +0000
Received: by hermes--production-ir2-54ff696c44-2j284 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID c5026a28b2bfc6e9bc27b4bbac0751bb;
          Wed, 02 Apr 2025 13:52:41 +0000 (UTC)
Message-ID: <29f73af3-e097-4c7d-889c-394ae1d2d961@yahoo.com>
Date: Wed, 2 Apr 2025 14:52:40 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: rust: quick-start: update Ubuntu instructions
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Benno Lossin <benno.lossin@proton.me>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
References: <20250402104759.1764282-1-igor.korotin.ref@yahoo.com>
 <20250402104759.1764282-1-igor.korotin@yahoo.com>
 <CANiq72mysmMph1zGAxPKDY_FixbRRa0kS3pSqj4Qhq6Yjqq2AA@mail.gmail.com>
Content-Language: en-US
From: Igor Korotin <igor.korotin@yahoo.com>
In-Reply-To: <CANiq72mysmMph1zGAxPKDY_FixbRRa0kS3pSqj4Qhq6Yjqq2AA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.23590 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo



On 4/2/25 12:26, Miguel Ojeda wrote:
> Also, weren't we going to mention `RUSTDOC`, `RUSTFMT` and `CLIPPY_DRIVER`?

While re-writing my changes I found out that while packages rustc, 
rustdoc and
rustfmt of version 1.80 in 22.04 and 24.04 at least create symbolic 
links to
their tools in /usr/bin/, rust-1.80-clippy does not do it. So the 
clippy-driver
is only accessible by its full path /usr/lib/rust-1.80/bin/clippy-driver.
I'm sure this quick-start.rst should be updated, because from my 
experience I know that it is painful for newcomer to configure Rust for 
kernel properly in Ubuntu 22.04/24.04. And to be honest, I see 
`PATH=/usr/lib/rust-1.80/bin:$PATH` the easiest solution. Rust packages 
in 22.04/24.04 are screwed. I checked 24.10/25.04 and these versions do 
not have such problems at all, it's just enough to use `apt rustc 
rustdoc rustfmt bindgen rust-clippy` to install rust 1.84 and bindgen 
0.71 and set `RUST_LIB_SRC` variable.

Best Regards
Igor

