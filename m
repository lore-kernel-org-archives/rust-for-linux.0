Received: from outbound.pv.icloud.com (p-west1-cluster4-host12-snip4-10.eps.apple.com [57.103.65.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3282136BCEF
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 23:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.65.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769728235; cv=none; b=Sel6PkXHLi7hdYHdY7n7lUfQMIYABJmFYUeCCLYbB2u+xnZd3Xhq00r5NI6BVCUn006WuV2nGUoYNRvA46043nhO8Z8LF7vl78a0MkLSumMO8S6h4ArmvwPMtdWTQJARBPr8ZMMyRoq39i9D/6ifiGcC26BYj1UQxyRRV5dvc0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769728235; c=relaxed/simple;
	bh=u2wAT2vhZjFOeW4aRg1F0RY3rFtcPkJ5mtD+8967/8Q=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=MhCIkyot22/pABijH7vb475TLN+yWNiP7BZFZ8TPY7uWbiSeAQOstRl4e3h7UlhhcYsfs4zl8fLJGv6uGGM0f23bi2sZ5SVDFq17iRshyKPI08wA4lUI0UYvpOcDj1SEcUe41whfP4+alqZZrV1nuGR7jwWr8JrKxplAHg6gGUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=F6sf7Omq; arc=none smtp.client-ip=57.103.65.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="F6sf7Omq"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-10 (Postfix) with ESMTPS id 656A21800F8C;
	Thu, 29 Jan 2026 23:10:30 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1769728233; x=1772320233; bh=ky3bLQLZsL5Leo+0TADMKO7dLRtrhwP0ahyukbd9lYc=; h=Date:Message-Id:To:Subject:From:Mime-Version:Content-Type:x-icloud-hme; b=F6sf7Omq6+DagJShUbK0Wmb0q6k4nvbSbfQ2SchI3tBEr7q82vUT/1uNh7NVHJeeHzBCmwQWFJGlq9oxZk/PXIj7HuYU8qjQD7q423o15l49k90g2hg2M6xjKYup+8yCQAj84fecZIC8pomqqslOx9n2f7FitRQVk4s6dJfKCEAot4y/Yjpwow+vo68jVRxUglFejgIORo6/yRBHZORpV3O+Q5T7DoBNE/TmGdqXZzcKj1I429QL8E4uVNdghQN0P9bVYyps7RrJwOQ5XQw4fRgMjrBR4RlYBPRuQNCRaroQrqo0COW1QRysjOwoP5BaQIOq7LWeXV3FRGRQ+Yu5hw==
mail-alias-created-date: 1769500909675
Received: from localhost (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-10 (Postfix) with ESMTPSA id 19A7D18000AB;
	Thu, 29 Jan 2026 23:10:27 +0000 (UTC)
Date: Fri, 30 Jan 2026 08:10:26 +0900 (JST)
Message-Id: <20260130.081026.1940544935415358894.fujita@bee>
To: ojeda@kernel.org, gary@garyguo.net
Cc: fujita.tomonori@gmail.com, a.hindborg@kernel.org, aliceryhl@google.com,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
 lossin@kernel.org, tmgross@umich.edu, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: bug: Support DEBUG_BUGVERBOSE_DETAILED option
From: FUJITA Tomonori <tomo@aliasing.net>
In-Reply-To: <20260108124240.239a5338.gary@garyguo.net>
References: <20260108013350.2880613-1-fujita.tomonori@gmail.com>
	<20260108124240.239a5338.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDE3MSBTYWx0ZWRfX3ppDIFmFDXyq
 4izx/HfXvCegH3v7mT6JRMZoNLUmTz6RbJ7WEgfR3CnFJGNtcMPFfHq+leWSOa8x34FqxtzQ8PL
 Qsc7JtrrmRI5nmv9WRQAG4bQu0qnaeH3os8YTWY6d4KmboBlK3aV8mXJRMqSlX5NR05/tL9xc/A
 5eIvfZRRgEAT0aQc7lszxbxnNpNvkuNtknAm3lU1sXEBKp9ZTB/B41Ub67dy1pfSMsTQ9yaebsy
 5vIwB0CUpFPJVg4yFpKfylIbuHfqZ62hR2R3dZ6NsjeavTIXYcRn8rYADBINyxbB2RcH2ltL5Ai
 WmiS4Mw7v02aAr+GdEMCUQcHa66KCzvI4iOHmpGMwxpmL8gWigPRoE5ikBBTSE=
X-Authority-Info-Out: v=2.4 cv=FqYIPmrq c=1 sm=1 tr=0 ts=697be8e7
 cx=c_apl:c_apl_out:c_pps a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_2yia0w1AAAA:8 a=pGLkceISAAAA:8
 a=C4QlOmdVP5ocQQY890EA:9 a=CjuIK1q_8ugA:10 a=4yAS8WwzZ1jAEY03B-5r:22
X-Proofpoint-GUID: 0S64lgb03JLJULxgNMZ1OaPN7otyvScU
X-Proofpoint-ORIG-GUID: 0S64lgb03JLJULxgNMZ1OaPN7otyvScU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=531
 clxscore=1030 spamscore=0 mlxscore=0 adultscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290171
X-JNJ: AAAAAAABoGzwOnbRe7DNUp/q9YLXsD1HWuBeOfkDD6Z3On/eCSpJWV9+o0WGWVvnXQroxgKDqjOGRdDuHOmVrsekwcRtFrG6R9qn76bav/iT+saXoWdEVeH9Ka6F2NNQxHugoTpN8xbI019szlNwuet8ChBVMU7dnBIo4ZNTQ5p0OjMcJni7QMUNVz6oWYkYbZ5R0MyaLsR1WCTQB1vPEAmCcaTY2WPg0nTXv/uSQjpx6rwMMtFjUAK0Fjt+axf/plA+OtsDv8JWkN9etu5lvWh421WeU1i4OETU4N1jA4vtx7dt/lQLumDTzyMVskURfdko3XsCl1OhsUVkkx4vuENmweLRPXpFdCFGaoHDM6dMAObzXbXsiyu3ptHOqN8rs0u71KYHw9qWoCs4aJGkPYGgT0N+jPOW91takoxseqt8KfPCKFWNSIpQ2jDnh52hHIzLhqxdyeAvQy9CU4d2s7HUdA9FeKhRV4HK82Ul9HGONeVdEv7+xiYXxdCDCymt2W+s2lJ2PJzmUQzD9d4GNBw1KPiTfeRH2hMV755gugqrq3hIr7YYcvB4sUs9Un6ezl1qJBBS83iv7//YuPWgj/Hs6DK0a+uJWKNyXc78Hr7bZgTxBqcWv0VSwA7D2VD06L5P94yof3g5wphGlfmhmgIq2I1yjldphRqLB51+SvGGx2IGp8GlBMh5RYvXTMeq0ag4G3h/lgy4HTLKfN5KWoqs5LjYjtSSSDX6P6KYZJYKuY4gGr49tecbxsinZ+HnEvjWvSSZNJQTJniqS8Y=

On Thu, 8 Jan 2026 12:42:40 +0000
Gary Guo <gary@garyguo.net> wrote:

> On Thu,  8 Jan 2026 10:33:50 +0900
> FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
> 
>> Make warn_on() support DEBUG_BUGVERBOSE_DETAILED option, which was
>> introduced by the commit aec58b48517c ("bugs/core: Extend
>> __WARN_FLAGS() with the 'cond_str' parameter").
>> 
>> When the option is enabled, WARN splats now show the evaluated
>> warn_on() condition alongside the file path, e.g.:
>> 
>> ------------[ cut here ]------------
>> WARNING: [val == 1] linux/samples/rust/rust_minimal.rs:27 at _RNvXCsk7t4azzUqHP_12rust_minimalNtB2_11RustMinimalNtCs8pcx3n4
>> Modules linked in: rust_minimal(+)
>> 
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> Reviewed-by: Gary Guo <gary@garyguo.net>

Miguel, any chance you could merge this?

