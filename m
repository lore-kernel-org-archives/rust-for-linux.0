Received: from outbound.mr.icloud.com (p-west2-cluster6-host8-snip4-10.eps.apple.com [57.103.70.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CB22DB7AA
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 12:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.70.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772110770; cv=none; b=CySHwBQc8zt6oEUTyc5UBXUA8MrbM0vuvKEwda4epZ7SBdZ+YrJxjZLf0sdMBbgTESBqRyFIC6AYffevLgP3o2eOvStTvEWE/HLOmDap6XnDhkMPG/9/UZNSnH/yzbBwC80OFb3fC/B2PeSLWs3/1DImTYrX4VOCxPCdhVoZq9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772110770; c=relaxed/simple;
	bh=G4j6e7+BDNHctPlLs9jFJKwv3njjRQx2zscDmhYp1GU=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=uf9r31hry6UU4FZPJgiBl7ME63slmoXkfK3WKMK8SRUKirons9L9+Pbp4ev7d4L3A4ZCZ9ivYMDsAnXTaKGmDj4SHuEoi38fRxBCynnTTxFcXwQXGISaxRAEyshdQoSvWlSqF9WIaZXaUDpmFzSoRGXqu2b/h3WB2aonL5KWISU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=SBcTo1pf; arc=none smtp.client-ip=57.103.70.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="SBcTo1pf"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPS id CFD231800467;
	Thu, 26 Feb 2026 12:59:26 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1772110768; x=1774702768; bh=HKlz/9Uzul+m9auzfC+vy/iHP/iD9Xpti1cZKOOrOVk=; h=Date:Message-Id:To:Subject:From:Mime-Version:Content-Type:x-icloud-hme; b=SBcTo1pfkMB44AEvsNWXSbd+B+0j8PlXK7TW+ykj/o/c5+LCKzTJgjUJNbyYLlrEA+JwjasKh2okbEb+ZP/zYOjgZrckGem/F7BixBFimFG/3g3A3ZDsPnfEyDgUJHfVyhTRcujbMDUrDb6V6f2up+QiUVtaBG/mKQVbYiWMyj+zBxUXk42SpZQED5DxMg8SbqEe5v7qUAYg9XKdixfSm3wubPeW9TpH0AFCAnTLRPS84NIepEpF9yQiSemIdCu4gP6RFnocHFbN29RVAaI/C3D7krk9W1cTaJF3/Ze4aMjBh8mglO8OvpIgyDdseaEknm1HAaqpLhZEO2G9MJqdUg==
mail-alias-created-date: 1769500909675
Received: from localhost (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPSA id B1CA81800847;
	Thu, 26 Feb 2026 12:59:24 +0000 (UTC)
Date: Thu, 26 Feb 2026 21:59:23 +0900 (JST)
Message-Id: <20260226.215923.1020202093931415612.fujita@bee>
To: adarshdas950@gmail.com
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 4/4] rust: time: add `pr_warn_once!` for clamped delta
 in `fsleep`
From: FUJITA Tomonori <tomo@aliasing.net>
In-Reply-To: <20260226120848.82891-5-adarshdas950@gmail.com>
References: <20260226120848.82891-1-adarshdas950@gmail.com>
	<20260226120848.82891-5-adarshdas950@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DN0t9srL9xICJjkQwuNc0OQ49freKUF6
X-Proofpoint-ORIG-GUID: DN0t9srL9xICJjkQwuNc0OQ49freKUF6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDExOCBTYWx0ZWRfX8BdP6XiMlh0h
 3iHXGsuMTBoK1I0Kfa5sho4GBenVTkeagPfZPBF3FsLvenPYXvuQbb93J3mcS/ruGNNmYviuvhr
 uuaIeWhTZGOc6aOfoY+uGF422qBP5vfn/kj96qKxubYdJvdLJLgPjdi6Rz1P4v6akklUFyqXClw
 tTWO03MF12D4/QaKVkDA0TcK7aZhES0mE3TEy395qSHMVDcoMa2Ma/hUL2AAzdUBwyfK6q0VFY3
 HRYiWvgNCcWCzmLKIY4mrmwrCqVAgvLKqGxOJjCr3+LV4DPEUNmzGYgrTeBPJ9cE8I3Q8oUmK0O
 4eKH6ND8drTwKm24+Q7sYlXUgl7wBTJ9vCAVGpzUOXuTGW0bISbARvMoNK6FUA=
X-Authority-Info-Out: v=2.4 cv=Q+vfIo2a c=1 sm=1 tr=0 ts=69a043af
 cx=c_apl:c_apl_out:c_pps a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=cAV4dH-aPzQhSy5cs2MA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1030 mlxscore=0 mlxlogscore=452
 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602260118
X-JNJ: AAAAAAABIDuH5J/DSteGDSIzaRDTtnde7OcFerFXrIg67J5RS2ry88SgrLtBcULvKTpLkRv2b2IONuCKsNQB/ehTxZcwfkxVethj2Ao4ArhOwmf+ugnSesA1ZKYIRg0P+nFZapfP8iyWdhkuN7hJ1v5J+9GF1AJfXk0/CD4Jp7Z7SXNIToB4A5P09qKw4a1c79r4oVR1SBo6zbqrVAzw65kbEgyjUYRwJCNh2l7Bnm5VtGiLolEYQOpCNrEgZA6DE+69GcLHK32SsKyQ2kVJ/JfjU9FxE4132dyzfMKWD5oHCxm0SBG0xSzGB90mJk3lDlRwo3pXWrlEuyh6UV1h7PM8Xh1NFJJuludA2jhWKyW0dwwPaI7ANI2LUv2V5NdzY+jkMccwTwZqIVPgsPm7poCvy+GlPV0w4MoXbuddoXE/RGD7mIjYecdA5L2jL6GmuWt+KS2+zoO9S3O9hO8bAy5kVhxVRzeevVb9WxAFb/MjoksWgm00NMTiQf0jdvnxgXbu3TCCC7wLopwdTTi8B5jz9UzMPqRRru6euJv/jDT8lgaCjC3/bCfvcI9pKmwjegAKsP9DBsTweH9uliE9Y315iegaLNv/pkQG73KPPeq9n8M/5KkmdOgnJkEZalxhNIAmNSfFpn3624T1C55BoQpTrvraD2WrdyBV4/4UKB3bx05+nTgY61q329a507tiKd5T1QWzq7vZi0+B5KgorcpJf0P67Q+WYwX9oRsyCtQu87AWYd/yMaVaLgieWebtkr9Tprl6o+SWKPYkiFSVjypjRtEWACNhLY//3oi243Bflny2

On Thu, 26 Feb 2026 17:38:48 +0530
Adarsh Das <adarshdas950@gmail.com> wrote:

> Add a warning when the delta is clamped to the maximum value and remove the TODO comment.
> 
> Signed-off-by: Adarsh Das <adarshdas950@gmail.com>
> ---
>  rust/kernel/time/delay.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/time/delay.rs b/rust/kernel/time/delay.rs
> index b5b1b42797a0..0965fcb6eb80 100644
> --- a/rust/kernel/time/delay.rs
> +++ b/rust/kernel/time/delay.rs
> @@ -35,7 +35,7 @@ pub fn fsleep(delta: Delta) {
>      let delta = if (Delta::ZERO..=MAX_DELTA).contains(&delta) {
>          delta
>      } else {
> -        // TODO: Add WARN_ONCE() when it's supported.
> +        crate::pr_warn_once!("delta out of range, clamping to maximum\n");
>          MAX_DELTA
>      };

pr_warn_once() and WARN_ONCE() are different; WARN_ONCE() also dumps a
stack trace, which is more appropriate here, I think.

