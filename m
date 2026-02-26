Received: from outbound.mr.icloud.com (p-west2-cluster4-host1-snip4-3.eps.apple.com [57.103.69.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C87F23D7F5
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 12:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.69.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772110307; cv=none; b=qHV5SKK3tDqhhzHsLEqHAdySjxpPxlUBgvLOD3uxJJm4kxlt/DmQRdOxf5dbp1VXGGi46Ct9Pd/1m0zX7EqumMmTDXdVSY6jiBdvqYxZCynd/hjCSFc9rDmlCA5TyG4o3p5T5C9uZDUFzms88CZyA7a0MZak/TtvGsmwEBBnGAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772110307; c=relaxed/simple;
	bh=o2J3+fWlkAmR1UO3v2iHCcX1V3XzEl8E0D4Z39kkDrE=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=IK52hngv70/i9Xe9wFnngOwMJmFR5wBA0K9ztz8+USwLtpL6suNlq+xg+lSgiqXHtg7LjzVjW6ofgvK+y1rTEFMRH+wi2foL4sa/hmbAnFxnCgFJzSB41W68/NrgZNMl+2jzhJoiJ9GXaAcVYP6Kx5xLk9fZ3pw5fVdveCSCNeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=YIZyfL8L; arc=none smtp.client-ip=57.103.69.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="YIZyfL8L"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-0 (Postfix) with ESMTPS id E002C18001C6;
	Thu, 26 Feb 2026 12:51:43 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1772110305; x=1774702305; bh=DVKBN5OdIW0jGfPpHopnIoTviwkGpHXAo2ZWpr5E30c=; h=Date:Message-Id:To:Subject:From:Mime-Version:Content-Type:x-icloud-hme; b=YIZyfL8LkXGl9o24dmXHT71pl+qvSrNUVBW+2jkbaBgO7kIvgDX6QrfDijThdDSoZusJysww2RJXpWUqSLhqCU8ykQWfsK2qE7TQzu/N/Kw8TtVM44ADeLVCzlAkxQlo4O1vYCQU1MNMmEipmxm2CdIwodzeq9CPqCEFX0ghqz3M/njF1Npp+V3JGsAcP37tWEw0Kc1OEWlTqtc2l8ZsORDc7Pja4PmcaiFv7Q2qj+M0uBej811ymiudx2po49UaeCBK622eRwuAXYTf1ulVb1Fe91owzxiHCIKKGecgV+XmyCt+e/VlN4hb6NKHHlrtlNDSv7tPw9TiALGny4pikg==
mail-alias-created-date: 1769500909675
Received: from localhost (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-0 (Postfix) with ESMTPSA id DC53E1800583;
	Thu, 26 Feb 2026 12:51:40 +0000 (UTC)
Date: Thu, 26 Feb 2026 21:50:52 +0900 (JST)
Message-Id: <20260226.215052.2040587083248816676.fujita@bee>
To: gary@garyguo.net, a.hindborg@kernel.org
Cc: tomo@aliasing.net, ojeda@kernel.org, dirk.behme@de.bosch.com,
 aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, frederic@kernel.org,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tglx@kernel.org, tmgross@umich.edu, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v2] rust: hrtimer: Restrict expires() to safe contexts
From: FUJITA Tomonori <tomo@aliasing.net>
In-Reply-To: <DGOV7EXV8VO9.QR9UN9EV6DZK@garyguo.net>
References: <20260224132507.315637-1-tomo@aliasing.net>
	<DGOV7EXV8VO9.QR9UN9EV6DZK@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Authority-Info-Out: v=2.4 cv=Oa2VzxTY c=1 sm=1 tr=0 ts=69a041e1
 cx=c_apl:c_apl_out:c_pps a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=_2yia0w1AAAA:8 a=cHpjoAaQVRKGXfxu0XcA:9 a=CjuIK1q_8ugA:10
 a=4yAS8WwzZ1jAEY03B-5r:22
X-Proofpoint-ORIG-GUID: daB55VVd-Z6UA0QqdVBlltKEKMDsav1s
X-Proofpoint-GUID: daB55VVd-Z6UA0QqdVBlltKEKMDsav1s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDExNiBTYWx0ZWRfX6ad4P/Lqh39+
 NY15mlPYClIYLx3xERZfXmvHdyrT+sXp04idrsKI+nnGPgj+P8IGd4i8U+k4nQpsje+AcOLYOiA
 ARK2ZOXd59nb8JOIIiSj4hzwgK6nG6FKwvkW4sy7va+SUxE9S/4qaiQfII2qdyYd+H6sgxrFFuk
 xG70TjA1yk00B9+K8LTxRaWxkpS8TbhtERmY6rLxqKXk75c0uS770ziFHl7I+Z0z/jr+Jqt4gX/
 ir7ThayQfWBROb7aa5XZjpwDFL61oyxDwMigTdVRzmu02Qcpn3aJrz2yiHHyMOIMJVEItE91K60
 fydX0hKhFc0JEa4Y39agHAlxbbB+n55onylthGMb/eykk/Klu4h6siGAg0WnoQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1030
 mlxlogscore=511 spamscore=0 mlxscore=0 malwarescore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602260116
X-JNJ: AAAAAAAB7maQe3i7NuIjvQZTHF6EJvPKWH47em9jiWBRn1zhEd6VM6QDMo/7xmrbzAucwWC+xX05VAmOslIjCb17RRob0l7dGoMd2oI+SpjwU+sKgjd5Tky5ks0YxlNpxBew5YtilmiMND74Q/UzZc8OdujqZ5+/lLzNyUXDcYc6wrbj/ArS0l1vYJ8Vhf2ADY0gSt6Ll4GUm5KUBtqMbP1L0hS7RVpf7NEQbvD0DPa/0BAv/vM3rLVxlPIf9QXWEN7CtexHlcUXroVgyUXICuYKcnBBxK2E+CtDeKosP911JR04y2ZUXrVwR4k2FtRc6df1uB0MN688/rmZDCypbR6znjz7HW7fXpeCeCzRKU8I000TaWEGrdMCFzSgxfcnDpiE4SWCo16UFTHtmvhqAsB2S1R7RWe0pWLsqSxlXAtJHyLwzdBKokb/LGE/Gt6sf5o43WH3xLOR+RQ9/2JeZhrOYsLS10HnEvlfXtc1iTml2d7LGnajA1vE5qxG4DUWNGQuiOptKfrRaRcbNLe9AxIZyRA0v+qQTigTghJ2sXpRFB6PhikC9eWqtfW6muR9GdewAw8S78O7Vz69MdZKYB7r0t57pC8Q6sK0Z5xXhO41hnJl8ZbWTFmpOlI9fGBqExtD6NJG8jFqsfMIrQRyyzP8U7mCZwhmOKnYxdGVjBrG5k66nBZHakHLOuyD4oIoLgmUKiRdG1frcLy1tX1c17/1E2B3EOG9x7hfI+eI51coLAypPZrlq/eZDwmaG1C8Lj+0R3sePyjtz+hKCRmrWrkdCaj8OV0DotDdCrQkkXqf0ykaeYOVaTahOLo+p6FAGH508IiSKkZElKG/41ZqsQ7HprmfoDjJDJscqfFE6JBl

On Thu, 26 Feb 2026 11:42:39 +0000
"Gary Guo" <gary@garyguo.net> wrote:

>> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>> index 856d2d929a00..78e2343fd016 100644
>> --- a/rust/kernel/time/hrtimer.rs
>> +++ b/rust/kernel/time/hrtimer.rs
>> @@ -224,27 +224,39 @@ pub fn forward_now(self: Pin<&mut Self>, interval: Delta) -> u64
>>          self.forward(HrTimerInstant::<T>::now(), interval)
>>      }
>>  
>> +    /// Return the time expiry for this [`HrTimer`].
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// - `self_ptr` must point to a valid `Self`.
>> +    /// - The caller must either have exclusive access to the data pointed to by `self_ptr`, or be
>> +    ///   within the context of the timer callback.
>> +    #[inline]
>> +    unsafe fn raw_expires(self_ptr: *const Self) -> HrTimerInstant<T>
> 
> I guess the signature of this can also be
> 
> `unsafe fn raw_expires(&self) -> HrTimerInstant<T>`? Then you can remove the
> first safety requirement.

Thanks, I've updated the signature to use &self.

Andreas, this breaks the consistency with raw_forward. Is this
acceptable?
