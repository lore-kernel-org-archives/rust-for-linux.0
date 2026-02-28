Received: from outbound.mr.icloud.com (p-west2-cluster2-host11-snip4-10.eps.apple.com [57.103.68.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D6C2BFC60
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 03:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772248098; cv=none; b=l1Scbd6RI3/2OT1WvUCuOAryk/QfUYWlfqDx9hUq4pieAOzq+5PyjVy5egYt/Ziovjl3fm+6u9D9E4t6PZBu2eiTPalN2d1IoX6RQrCgu66RZ7ioTKLUtATrpwJVD/KO4J2SXv3pUx9ykwvEV37jkhnKJ0xDACO0gM7mVzk/PWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772248098; c=relaxed/simple;
	bh=5/33RIwclZ7H6PzJR0CQ9Fob07mvR9ft8MCUCLexuVo=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bomyfNYiV7VocwWf7ZZGnmiiM0Ku/5hzoDbLPs9iUPNC/KhPsOTGeg033FqTvha5cqY/jL4aMy0gHVu6VV26e4SsBtzq4H6QoslxnzKqyQI7vs0v8z1ZyA2nfh6tyUZEKLl/Q3gUlqxNq8D2CQD/gPMlKy78BFPA6rCknVwsvrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=N461aaW0; arc=none smtp.client-ip=57.103.68.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="N461aaW0"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-4 (Postfix) with ESMTPS id 4EE981800128;
	Sat, 28 Feb 2026 03:08:13 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1772248097; x=1774840097; bh=sstvHFE1AJiQTGpUm5exjRae7lmo+G84ieX/fV24DXs=; h=Date:Message-Id:To:Subject:From:Mime-Version:Content-Type:x-icloud-hme; b=N461aaW088mtwGCmvdg549WJ/60fKgVBHdyLrHaLcTxLc5n3WyqPGFYlFSgufnuTnU/9wnYhrxutSOjOcLwYXZ04+CaWMQohhKgh+AlFrgkTh8F9eONt+dMiK3ccK6kzbaXrEn2WnmxqBjetTXijeyT2KEy9EaiGqtHoSuby5laMWLycCB1f8Zf5Im1sLX0jEVyO8oMkNmWHgL6V7JJKYv0m1jCPDnXNwTvZ5Dc6DbkExGuDzGi2Q2ndh+v0I61Raw9RqbcnfUT99zVi1fU2xHaXpY41im1TYTLc0TuJV/Olwo6MbBsOtgUXVyNzBC9IK1keU95GK+ZBF839FoY1ow==
mail-alias-created-date: 1769500909675
Received: from localhost (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-4 (Postfix) with ESMTPSA id 27EE518001C6;
	Sat, 28 Feb 2026 03:08:10 +0000 (UTC)
Date: Sat, 28 Feb 2026 12:08:08 +0900 (JST)
Message-Id: <20260228.120808.423470088962258309.fujita@bee>
To: a.hindborg@kernel.org
Cc: boqun.feng@gmail.com, fujita.tomonori@gmail.com, frederic@kernel.org,
 lyude@redhat.com, tglx@kernel.org, anna-maria@linutronix.de,
 jstultz@google.com, sboyd@kernel.org, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: hrtimer: document handle based design rationale
From: FUJITA Tomonori <tomo@aliasing.net>
In-Reply-To: <20260215-hrtimer-docs-v1-1-bff6a6c0d923@kernel.org>
References: <20260215-hrtimer-docs-v1-1-bff6a6c0d923@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fq3nyA3M4_-XZ_-C2_FAXGR4LQbcQzq9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDAyNiBTYWx0ZWRfXx1sOtS+itdN8
 HUly2O9PxCREyxlD9gwFfpADrkRB6U3k7kixfD0pQ+ghgyHwL0wg+kRzp1Cteg88vBmQZWiAjnK
 ITargg/CrfM52bHF1dsTHaRj8qb9gE1349sCj0/OsIrX8rjFGNw5xWgYbD9dbSnTZvLhI33xtqT
 BXx7piewIlmddiTuqjSlr622hhQZtdzMWbilam49X9v+4Zcnt1GNiNUsosrQlnKF5sFVAKU28i9
 p7+9GinEtDKIadKkRqQATLIZdGz7dSgsshlm2xBJSmYou1MdnWLZ0066kuPgQ73XCqz41Q2XH2P
 1j+yFxyfp3nCKxhFIf0uz37dQHsKNWqG1lYNOzhxicZDsuj+uxq39H/2olIHnQ=
X-Proofpoint-GUID: fq3nyA3M4_-XZ_-C2_FAXGR4LQbcQzq9
X-Authority-Info-Out: v=2.4 cv=COQnnBrD c=1 sm=1 tr=0 ts=69a25c1f
 cx=c_apl:c_apl_out:c_pps a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=cu8r0ib7BQWouZTaLqMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=709
 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1030 spamscore=0 adultscore=0 mlxscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602280026
X-JNJ: AAAAAAABuhBq2Oj3eqauPjCWDysXWnRE0DB5jHj1bNDrKI53loL/jQhj3MXSxz0Ep4mXlhE01GxJ6kFnzwzkK/ViCA2QzShtJkUf5K3hTohqxZevarAXYtk8S729YJ8zP0ievkA0Vr2qGDpFc77eJgbKkevUHwd2l4ONE/SBVjV2AsLbrv8lE+h5TvXB0RsR/MdPI0P2PMwpgFP8WZSg7LjDwnsXiwRG7qbji05+p1BBk/pGd30+LSjRaHruVuKqOyAjW67PebzJ9E1cC4A4k1Y0TGPKYsE9ks1BQ19TbVv4+wv1vhvrG3ubB0uzZvZXpGLey6ZWw/HGXPD3QAGR/7efoRgBmAdX+M91jjXmzx05H+9E7czdHBmF3C7mxN2SPSRQyKESb9jBGc/4rC53pG+MyfX0dMoew5nnZW8feUi/CdOJL2Fhcfk4kR9KbTuBqdnOitoQ4HRrRpJiCJrA2R4JbXCdhQEYDEMcVkYiMEaxX0ZLOjOpT3pqx8DwmLPfCIda7qSs7S1OVFCWM0JIpYxPL0P+ZOLgAA0fut4PAlCdx4XU9K1iNxKkTAzqU3HRFBAQHyL0yrPmM8ue7tPomLrZREu9RK0UykQBXjpbBq4tRZrtasuuEsPe3URu+U0uyOA9B7pKtVSFq2N3sZrM6hp7yi9NqFe2QSvOvD1xeL7jKjPTrE3lQQ/wWaJa/u32srPvdbhog+iAuwIIpiAuo+gQvKbsUXQqsjhESSB0puu4QqNIurhuRQ84Ht3sn3LgaSSrp1cmdnaSv94ETy3FEcy5TDYD0iRazx7pwJpdnydMHANRDBnUxnoN4+ZRd/CfXNbatuj1u0X8oSNF+/vUp7bCXUo=

On Sun, 15 Feb 2026 21:36:04 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> Add implementation notes explaining why the hrtimer abstraction uses a
> handle based approach.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/time/hrtimer.rs | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index 856d2d929a008..f92880b2cbdbd 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -67,6 +67,18 @@
>  //! A `restart` operation on a timer in the **stopped** state is equivalent to a
>  //! `start` operation.
>  
> +// Implementation details
> +//
> +// The reasoning for adopting a handle based approach:
> +// - If we explicitly drop the target of a timer callback in the timer callback, we
> +//   may get a dangling reference.
> +// - If the callback owns the last reference to the target, target may be dropped
> +//   in non-sleepable context when the callback is finished.
> +// - When dropping an object that is the target of an armed timer, we may drop
> +//   fields accessed by the timer callback before we cancel the timer (drop order).
> +//
> +// By using a handle, we can make the handle own the callback target and avoid these problems.
> +

Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
