Received: from outbound.pv.icloud.com (p-west1-cluster3-host9-snip4-7.eps.apple.com [57.103.66.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CBD221F1F
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 00:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.66.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769647225; cv=none; b=JV8lEJ+ORWyFBEUVDWZnK6UFMOwl9tFqsDKrH0DTivdg8O3c8axLGfRoMY54lu9cmEC5VL2gtsjD3buCmmIIPWdqB0koYDlTx702OkPw4qLVIZAT+WY04WBuYVNmBDwmFdyCOmeiV9hQx1kG+fEpVwzkZRE4vIjlPR8vNY6tXRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769647225; c=relaxed/simple;
	bh=yLiqKtQpn1tAtadAbE0mOax5PqB0M/8XNQ2GTkxEz24=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=S2/w8Ug1wdjga+xu77ISQ+jAO8LC/dL2iTkmkdzGBUzoLHQgzXyDWfIECltD4cDsk9knVVMqTbPFcQQZ+hdslSZWqfKixrmKSNXwS9jgkeFssfXwqwCRB5TEkeBSqfGDo+ZFgNMoRbu8M93AxlQmGCgw7LHMWZXRifmLE5iE6LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=l6RSZP4B; arc=none smtp.client-ip=57.103.66.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="l6RSZP4B"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-7 (Postfix) with ESMTPS id F33BB1800123;
	Thu, 29 Jan 2026 00:40:18 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1769647223; x=1772239223; bh=vPC5ollCSbts6rwKFeYtcPtTThLqO+XQNpCXGATshig=; h=Date:Message-Id:To:Subject:From:Mime-Version:Content-Type:x-icloud-hme; b=l6RSZP4B0PmNd4+5c2ZBklvrKcAAA/ms2JaHpfuhazjo4VtASmyWv89vIr/HAzErsgmyrASdmA5nwFMzioUDATTd6zdO4aKUVQEr0DBN/GOjhUxQIXJsXT1vDsIludFCpOGAeVpuaP0bSOTeXmSk23TfmRENMP5jUC/nCRNUQ6gtKeDyyh930f+Y88wiu8f3+LKocJCvD1GZrLGIp/oDBAfTMKiVBVT55Njk+3gkC/JFxEHjSoHMjNA+3F2uKHEyKxOJeaiFU0FdfNdaX3VGKLj8cmMJXFnrAphinWT57wWjEilttvxeKnYjguPI321awXUxWxz0a5UYb4buc5voMA==
mail-alias-created-date: 1769500909675
Received: from localhost (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-7 (Postfix) with ESMTPSA id DFABF1800135;
	Thu, 29 Jan 2026 00:40:15 +0000 (UTC)
Date: Thu, 29 Jan 2026 09:40:14 +0900 (JST)
Message-Id: <20260129.094014.1882462265380245984.fujita@bee>
To: gary@garyguo.net
Cc: tomo@aliasing.net, boqun.feng@gmail.com, ojeda@kernel.org,
 peterz@infradead.org, will@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
 lossin@kernel.org, mark.rutland@arm.com, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v1 1/2] rust: sync: atomic: Add perfromance-optimal
 Flag type for atomic booleans
From: FUJITA Tomonori <tomo@aliasing.net>
In-Reply-To: <DG09KR1O5JL3.3VYRDKRR8UXX8@garyguo.net>
References: <20260128115200.3820113-1-tomo@aliasing.net>
	<20260128115200.3820113-2-tomo@aliasing.net>
	<DG09KR1O5JL3.3VYRDKRR8UXX8@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAwMiBTYWx0ZWRfX+bdBDuAJ/xDr
 kfHc09P0/iz8q6j6ltwdbv3FRVKB2f+dsRk2kgf+bSiXl5464Wiu44qWcbuuAwE67ropApOKAbM
 ZVxytyCOvOmluCzcUU/P1uSt4//vpvwSZiE3fjC76KGPi0lyDeOo/U8OgwRJTmlaMv74rSZ1JeE
 gw/3c9rxGqu0UDOKFxb/oQIoXIidfzjAkSo0I8t0bBmqg3eng15fJwMZqp9udyDzQVhARCvea/S
 XppxLCwecSk20Qoro1cCXo0RCgVig81scdy5Z658bBj7ieaB0ouuwXdE3WswQJKVOfZV71TOTcU
 aFCDVLsm/V1voQzBMSycssyHoKwbJGgK49MqNiSbSB3yZn4UDtvHnP0Y49zE4k=
X-Authority-Info-Out: v=2.4 cv=L8kQguT8 c=1 sm=1 tr=0 ts=697aac75
 cx=c_apl:c_apl_out:c_pps a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_2yia0w1AAAA:8 a=pGLkceISAAAA:8
 a=pInEbAKqE_kzdbSFQZUA:9 a=CjuIK1q_8ugA:10 a=4yAS8WwzZ1jAEY03B-5r:22
X-Proofpoint-GUID: yZmX1DUoJtby3IXKob98Ug_b9DzivctB
X-Proofpoint-ORIG-GUID: yZmX1DUoJtby3IXKob98Ug_b9DzivctB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1030
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290002
X-JNJ: AAAAAAABPVrsUSZMwvO02YqoKEFMfaaaAC3rgrkTjbPsiacF/4ZWGEn9wmc/WSEm2NPWmFLytoptw9VUI3HwwS4HGOtXSnxDYKhY+vWNOKYvNFX+gaHPFsWeXIFeP32t33jcD/dp9wRAlEPpix/xTiVcsZaAF4RqsDWcQF3fJH/7tGXuoR4U3e2wMYOde1Hz1dZwPd5IzJoIBe40K67rZHeWHIq/ytX9zvZ1xqgh2YovITdu6GzfkNPJFTd39JTrVpNMkSUsTEYmQ40c2plFPTQ8a4dCC1rf2lARhibIaZff5BWVEDN2gxnmHwQiBvLw/Vfdfdb4zrWZ76FLZwyn5T2b8HXU34Mae2uXRoKYVd2Rp4b7lDjvhNqSABmTP7MIYQhjFuZ4pQ1TmfazNJt/a/ifLyCykhvXqrHBRWlKEgjN/lVFD2Q2bUIPsLY0N6pSVmRj3QUFhnv4jKRLjNAaCfVraDyIHi6Iyf/dbHzP/JlMbVIbXR5P+JCoFS4M/A4e1svW5p735XUXzNaHdymZoH8RE+4KVdrOSNoj4+OtQQfB27xBSVtuUGJkKpRgNlrya1o6vZcERUk1OlXiXZVaCaYsTHsYZyZrsue8GLKRb+ElQA1EdrunWsjsEMHloEmI2AHq8jZdbRwy95TNKDTwokNi30HS+Lr/H1GxY3u94UOZKcEFKkDGlSutY/np2pWliBZyBf+hW1mfZxL9FMUSWEjryewbdQF74ZiNfSZU2siOrRj2yLdNSVezEub6J6lMdmrp02ZMkgj/FA2GNY0p50LkDTYc6j1ViJHndiYJt+A9CjAitsrMbCwHvBw=

On Wed, 28 Jan 2026 13:41:41 +0000
"Gary Guo" <gary@garyguo.net> wrote:

> On Wed Jan 28, 2026 at 11:51 AM GMT, FUJITA Tomonori wrote:
>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>
>> Add AtomicFlag type for boolean flags.
>>
>> Document when AtomicFlag is generally preferable to Atomic<bool>: in
>> particular, when RMW operations such as xchg()/cmpxchg() may be used
>> and minimizing memory usage is not the top priority. On some
>> architectures without byte-sized RMW instructions, Atomic<bool> can be
>> slower for RMW operations.
>>
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> ---
>>  rust/kernel/sync/atomic.rs           | 121 +++++++++++++++++++++++++++
>>  rust/kernel/sync/atomic/predefine.rs |  17 ++++
>>  2 files changed, 138 insertions(+)
>>
>> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
>> index 4aebeacb961a..7d06193709c0 100644
>> --- a/rust/kernel/sync/atomic.rs
>> +++ b/rust/kernel/sync/atomic.rs
>> @@ -560,3 +560,124 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
>>          unsafe { from_repr(ret) }
>>      }
>>  }
>> +
>> +/// # Invariants
>> +///
>> +/// `padding` must be all zeroes.
>> +#[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
> 
> This config repeats too much.
> 
> I think probably we should just not let `AtomicFlag` alias `Atomic<u8>` (this
> has the benefit of creating a type mismatch, so code cannot rely on this on x86
> and fail to compile on, say, RV).
> 
> This way the `struct Flag`, `struct AtomicFlag` and `impl AtomicFlag` would
> always exist and the config is only needed for much fewer times (plus, you don't
> need to macro to avoid duplicating docs).

Agreed, I'll do.


>> +#[repr(C, align(4))]
>> +#[derive(Clone, Copy)]
>> +struct Flag {
>> +    bool_field: bool,
>> +    padding: [u8; 3],
> 
> You probably still want, on big endian platforms, put padding first, so the
> generated instruction uses small immediates (0 & 1) instead of 0 & 0x01000000.

Thanks, I'll handle this in v2.

