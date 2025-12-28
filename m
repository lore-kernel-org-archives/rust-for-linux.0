Received: from outbound.st.icloud.com (p-east2-cluster3-host9-snip4-10.eps.apple.com [57.103.77.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C7723B63F
	for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 09:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.77.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766913208; cv=none; b=cjk9YLb7v6FyaPF/w6iLBoxGVvMzzhoQzJrw6BTkWD0fLAfyB4qhgxacOF7kiaB3+IEaNF8D/eXbx5V/opAGJN0S1U+jWHnyqUwdUAmlNgif3jvOXj56BjgyS/J/1/ly9ovsPyChEVMFNXjmeGQPKe56uGeK5a+WdCWL7WC4SWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766913208; c=relaxed/simple;
	bh=E7gmfdB1oE80QnanP/mD2QbimoDN1ml3JIe60ad4cQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOrkjMW1YcpU/K9P7wqQERPeFSVe4u7sRREF2zarCr7cjvBUiSftTlZSY0sjZs8FJMpow5tsCuhcoEeIP/UaLn3czO4EtI3c06IYV9u6yciwxbwK8p/SxNz7xyzXKyaJDZkvMmPaoABqAKgTz8srTkI06l5VoU2BauEeBbP2QFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net; spf=pass smtp.mailfrom=bne-home.net; dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b=Eo7M9L5J; arc=none smtp.client-ip=57.103.77.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bne-home.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b="Eo7M9L5J"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-12 (Postfix) with ESMTPS id 41A4318001DD;
	Sun, 28 Dec 2025 09:13:23 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1; bh=ZhN+Ut5Ys+u07KrZhDJT23W9qJ90DJOeYTb0t+j8iMk=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=Eo7M9L5J6RWV6aIRvL6oVqp7cHdMCwSobjRFLZTzJo465WihR76IBA8IoH4hc905k9oEMzLKz6S5hPtyfYTeYhq3wW5xSMJNxsPalidstXSzZuqEuenu/erOdofYU2mCiJjumcXk9c6UXZqcRbjiSAgVmTUNgjbaddR5oSFck1P34zNAnG/aEnJX7uy9Y2sbsT2+P8XXVinqXSxDTZ3LG32zmyBricWexGf0XC9NnAR/wxhZ9PHPW0Oktl8RiLDNWGq58bSuc1Rpk4+27exJ64opvz4ub6y7VmQ2hPSxFItujBKsMvr9A0c4CBRCKhTzjoQrXChdcIedY6mn6fQ6Ew==
mail-alias-created-date: 1746336505199
Received: from fedora-g16.bne-home.net (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-12 (Postfix) with ESMTPSA id A1A9E18000A9;
	Sun, 28 Dec 2025 09:13:18 +0000 (UTC)
Date: Sun, 28 Dec 2025 19:13:13 +1000
From: Brendan Shephard <bshephar@bne-home.net>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3] rust: Add support for feeding entropy to randomness
 pool
Message-ID: <aVD0qcGEaiTZYheF@fedora-g16.bne-home.net>
References: <20251226-add-entropy-v3-1-a3440823a07d@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226-add-entropy-v3-1-a3440823a07d@google.com>
X-Proofpoint-ORIG-GUID: 9RIQ83-G8yXu--MYV20SFRRRWPr6-xg5
X-Authority-Info: v=2.4 cv=XaSEDY55 c=1 sm=1 tr=0 ts=6950f4b4 cx=c_apl:c_pps
 a=YrL12D//S6tul8v/L+6tKg==:117 a=YrL12D//S6tul8v/L+6tKg==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=1XWaLZrsAAAA:8 a=DDQqT1NntRmF_x34F-gA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDA4NSBTYWx0ZWRfX+NGlfhqj+NPW
 faRhO0JLR2sEgJGBWbrrdRpw3Aglw9Rsi229ZoYEhjo2or1jSpGHPnz+WjHPi+ys0pBWkzWU30N
 tj0wmHbBfPbBPyOUOu81HN7QUmwIfSnH9tV+L/cqk3GRNPIh6k3g9u9dtPfRcOIE9xwA14i4xt7
 4mtEjz5KrvmlGkEpgBzTs20fhe/7lNrdtkeXXFrxCa693SQ2Xr8c5AEO7zXR4wcddDdrlNS36j0
 4tErB/rkGwml1NBW+i2d6Szp/HdEu114hjv0q+9MKT8OVC63UINgcYO9ugZYb+JndM+XbE82rBU
 Fa/ekeuyX/7rGx2t+xI
X-Proofpoint-GUID: 9RIQ83-G8yXu--MYV20SFRRRWPr6-xg5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 mlxlogscore=923 clxscore=1030 adultscore=0 mlxscore=0
 suspectscore=0 spamscore=0 phishscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512280085
X-JNJ: AAAAAAABiQYC7p6Y3CEwCHaVhtKWQknv6IycEYWAJnLTL+WqsXl3G+ee4Sg+Sv/K0dO7RIiqfeS/2+/Sk4kALSJ+nR1ujJmcm5EsqTFHQfYugV5EMdguRs0N1PYoXTIQwKbzNf8wd4WzHUayXJOCxOBl1HXHv6ONArNbb8ElqyBb3e6gSZuCViDNckJQjdh8MjE905zX3e15h+q2nK9VtfC4SbTnWX1y4gfRuvXHZYYQh253GHJxR9tIQjzrp3lsXviC8Ql+rxGq4HUZLSNpkJ2hKwTrzqf32ky+0Kw/8z8GtvTHoKdVXVca/RBAwaL1+Y90iGfZw3wJKdC31tch+AjWCTlx33/nDzkL/RYAjBMC2DdPQ77v6Gw0vNyTn9XXmUx/JUPRO6WtkH0YajiiXc8tZodBv39YcuGO0I4phZfl8WdrKymV+JKTe74b2rwzA8AW9/PGiFijNImK7ckaTWeJV4LDiPrL6QvWyUI1P24Jz8KC18m/Ky/yjw1zy4pOnmUICDxXjdXyTER4Idi+tSvQvmeZM2Dfn3oOXLcA2VmWVOhV4Um+HNbwTJdiohIobFWZFVj5nVa3JQ0EjJzpDMmm/1wYMm3F9X21/LgruCfx316t886AJMcXO6T6JhswkomzJ7vk1Vnlusq36LumiDLqxb/7CwvQAn1/cu6FwJT5R1ePm1K9NteFMu11tvYC/PPm17U7VK69XbVChurHnAgeda7dr9jfIn/aqDy9gyI/lUf7hCTK1Y3nTIE29A7i/OstJd1VE80=

On Fri, Dec 26, 2025 at 07:15:10PM +0000, Matthew Maurer wrote:
> +/// Adds the given buffer to the entropy pool, but does not credit any entropy.
> +///
> +/// This is intended for use mixing in data that is likely to differ between devices or boots, but
Yeah, I agree with Alexandre here. I think this would probably be better
written as: "This function mixes in data that is likely to differ between
devices or boots". Or, "add_device_randomness mixes in data that is
likely to differ between devices or boots." If you would prefer to avoid
saying "this function".
> +/// may otherwise be predictable. Examples include MAC addresses or RTC values. This slightly
> +/// improves randomness in entropy-constrained environments (especially common for embedded
> +/// devices).
> +pub fn add_device_randomness(buf: &[u8]) {
> +    // SAFETY: We just need the pointer to be valid for the length, which a slice provides.
> +    unsafe { bindings::add_device_randomness(buf.as_ptr().cast::<c_void>(), buf.len()) };
> +}
> 
> ---
> base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
> change-id: 20251029-add-entropy-f57e12ebe110
> 
> Best regards,
> -- 
> Matthew Maurer <mmaurer@google.com>
> 
> 
