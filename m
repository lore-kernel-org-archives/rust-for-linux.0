Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280842773F7
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Oct 2026 02:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790820566; cv=none; b=f1Auav/cA8pgkxSN9hV4SFYFcLfMCc1FuwkEtLFIyjb+uA5XeQpRRzSkjJ4EL65aQYN5Fh02JJuVmscOjJ/wiDSC9TAaTOeqrhH6imSApnyT1D3XwIZqg9bguoJMZNap1Zzdu11oFyQsMO9yOI/SbTGGcWTUuH3zrdSvJC0CEBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790820566; c=relaxed/simple;
	bh=blNiZijWBHRv8m42Lykh9hHgqMmqIrKCHIaM75OORH4=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=QB5ww3zYEYtZMwViyiNHb64X3qds5wN8eyERsuH+LZANHknCtbjXb/eJ4My96uOCEp41q8IrZAzRxSUVaCUme6M+jfGgzp/UDwYMotElJjpnGzebAiWXqfJAtz4yz9HzJ3mgOqZ6tUi3s6IzvfGPaHokU4ATlu6/ejw1i7weLj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=WGIU2hoF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qX7w64wO; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="WGIU2hoF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qX7w64wO"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 1EBE1EC02C5;
	Wed, 30 Sep 2026 22:09:24 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 30 Sep 2026 22:09:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790820564;
	 x=1790906964; bh=LmOLOLSCZyZn1+J/dX7b9kj4h8nDPY0ZDFk+E3WRZfA=; b=
	WGIU2hoFIVVovuvOc7R9IY7LhZw3Vkh/gWNxQ0fqihzvzlajQWbYUlCkCOekje+r
	lI5IyukVkHhhZ9v4esSdSf7UWI0r46hqpElrKwmbojBlxXfnOMVGYZGOgkyL3dcr
	kEKQmk3iAz4QmFRY/kMsL4kCwgrdvjjaD+rr6NDa4KutfrQx6PxakDUxUg99sq/K
	dj0deGIbWa6+n58Ceexidy7fJTVeym1Ec3BcpoIZy42Hcea9OiVHS2kC1dxizYo5
	of9oUv0VXjU41cpQFbCkkgcGoXSnsTg6V5Z+ULsRDqtsHIfN2SG5eNJa/6gPVO1C
	0Dl1prj/JSYEQjb8FNpO1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790820564; x=
	1790906964; bh=LmOLOLSCZyZn1+J/dX7b9kj4h8nDPY0ZDFk+E3WRZfA=; b=q
	X7w64wOQMmKoEO2iM/Zxy0yM7JwYbzcD0vFrxuG97mKSkyoLqmjOvQs7gT60e+S4
	S7Xmq4zHRGlMzMAkfKPcnsq+sVEmgIGZXdsVmRU3951nNLVrSJR1L6fwD5FKbf8X
	qfYJfyJ3aJFPcL/+tffhYw6u/gYmlJHOR3rY3yT/nJYX4OF5LawC42xJqzt6qZ2I
	BkKYPwCo5p9re09PCGWAT0ePkGM0pF79qxs6bnHOn3voE/MsOteSzcMtQlfo5P59
	dXFd8oR1C68m79uSwQN7bVXK8Bm6XCzhAcCU5Wtr+thubEO5ChXhPrPrvhyxsN8W
	Y8yH1IDOpwvR1SN3HgD8w==
X-ME-Sender: <xms:08C9atwzJQ5wHO3HUJPb9-9BM2CUpPDJ2cZJmkwjEKhCSuWHdZLUDA>
    <xme:08C9aibT4pIlE3edHTHW3a1pGdLHb0whpmL5V6WNE-Znin2U6VxbsU6-tvFzZSn9G
    EGwXpQzU9j4BfL6wJmurBJId0tUW0R2H751ydhd3ceB7dYQGOCFeApk>
X-ME-Received: <xmr:08C9aukUAT_MeoOuahsOb2FFvdldeJ0hIaAUKGGbK3jVCYZohi5Jb5ufbusvrQZvat-MnU67xxUOMalZeXesw6lt>
X-ME-Proxy-Cause: dmFkZTFa59hTSEbOlv6zWmQw8rNb01aoHbF0xqKkEoc5ohS01Shd9M3Psg7koPIqfvgXAd
    0EwhWV5/F8t1Yi5x0cohusm9oPewJ8IV6iLyVp/9k/2QHDqqtcT8VtwDCEFRjZZhF/PNzx
    G6xlUJzqLDRDKkUa1GKBB/SiHDr5N6fUYkGAZqCsXizXVA264murpgp8yKIooe9cvncyDw
    zoZhlOwCf40JuL+AXE0tY5GDY2T7+hg6aA9TDTl6bqdfxn5a6Tx1SIJgYdN4GGCOOamY6X
    JQyNc59pPiTUXOQgN1KelJTb1iSQP/Wb8mXNLpet1EIIvPbc0hh5o4WMIUWolu4dnEZgTc
    dokP+azvCZM6R7MTTOARuBTlKj1gT0TMGcbxgcF/rEsBjDnHmhuWHK7q8N8qb/mHopgHSp
    r1K8TGLM2JEvrYeajYcgYcKy30Ym8RBAfbIkNDAJFDAJkPqTmMIy12qgq8djPCKIJE0GJM
    t5pdBGjI/Qm1nUQFSYs/ir9woF+3oeCmpo8TxCzefkV+GRN/2UoQvmrFqQgjuBmcUo9rfo
    Lbx30veWjLPFRPjX1UbOtoT2P1vlAUW66nGbPZmUPoCCCy26rX7KYFAD8qseNUXzECTcXV
    yr6/tONA7YvJv9v9xn243f6w1VI44RZnKfYfGzPjgTgkVdgDN71RL5DQr/vw
X-ME-Proxy: <xmx:08C9anEeuR6TR_Jfqa9LiIsVfmf5yYoYNkXcquNDAOjU9d2Su888dw>
    <xmx:08C9aljPerGxjtQRX4CJ_Uxi8QZek8ozZQQVfunNxLe88QAbfRRGxg>
    <xmx:08C9aplCbkHGt3SnxsvQqUfMpkeOXW6Z-dtIkddYWN_o_t80rub1LA>
    <xmx:08C9audUH3sOwlYBubEaOJ_otVisHdDc6OLisBBadDEKiyOeQO3Z3g>
    <xmx:1MC9ag1E9I-xnbUwoyG-xqPB7T6Yur1yz0_ml6NRG1oK3oRZXEQSHPQF>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Sep 2026 22:09:17 -0400 (EDT)
Date: Thu, 01 Oct 2026 11:09:15 +0900 (JST)
Message-Id: <20261001.110915.1628653335575187641.tomo@flapping.org>
To: gary@garyguo.net
Cc: tomo@flapping.org, a.hindborg@kernel.org, aliceryhl@google.com,
 arve@android.com, boqun@kernel.org, brauner@kernel.org,
 cmllamas@google.com, gregkh@linuxfoundation.org, ojeda@kernel.org,
 tkjos@android.com, tj@kernel.org, acourbot@nvidia.com,
 anna-maria@linutronix.de, bjorn3_gh@protonmail.com, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, jiangshanlai@gmail.com,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v7 2/2] rust: sync: condvar: use Delta<Jiffy> for
 timeout and result
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <DLT38GATZIIR.1LX8EXAFFGJX9@garyguo.net>
References: <20260930014124.1454138-1-tomo@flapping.org>
	<20260930014124.1454138-3-tomo@flapping.org>
	<DLT38GATZIIR.1LX8EXAFFGJX9@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 01 Oct 2026 01:50:41 +0100
"Gary Guo" <gary@garyguo.net> wrote:

>> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
>> index 5372bfbd93b3..ca944a50c6eb 100644
>> --- a/drivers/android/binder/process.rs
>> +++ b/drivers/android/binder/process.rs
>> @@ -35,6 +35,7 @@
>>          Arc, ArcBorrow, CondVar, CondVarTimeoutResult, SetOnce, SpinLock, UniqueArc,
>>      },
>>      task::{Pid, Task},
>> +    time::Delta,
>>      uaccess::{UserSlice, UserSliceReader},
>>      uapi,
>>      workqueue::{self, Work},
>> @@ -1549,8 +1550,8 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
>>          inner.is_frozen = IsFrozen::InProgress;
>>  
>>          if info.timeout_ms > 0 {
>> -            let mut jiffies = kernel::time::msecs_to_jiffies(info.timeout_ms);
>> -            while jiffies > 0 {
>> +            let mut jiffies = Delta::from_millis(info.timeout_ms.into()).to_jiffies_timeout();
>> +            while jiffies.as_jiffies() > 0 {
>>                  if inner.outstanding_txns == 0 {
>>                      break;
>>                  }
>> @@ -1567,7 +1568,7 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
>>                          jiffies = remaining;
>>                      }
>>                      CondVarTimeoutResult::Timeout => {
>> -                        jiffies = 0;
>> +                        jiffies = Delta::from_jiffies(0);
> 
> Hmm, we should make `Delta::ZERO` work for jiffies too.

Agreed. I'll add a patch for it in v8.

>> @@ -182,19 +185,29 @@ pub fn wait_interruptible_freezable<T: ?Sized, B: Backend>(
>>      /// Atomically releases the given lock (whose ownership is proven by the guard) and puts the
>>      /// thread to sleep. It wakes up when notified by [`CondVar::notify_one`] or
>>      /// [`CondVar::notify_all`], or when a timeout occurs, or when the thread receives a signal.
>> +    ///
>> +    /// A negative timeout is treated as zero.
>>      #[must_use = "wait_interruptible_timeout returns if a signal is pending, so the caller must check the return value"]
>>      pub fn wait_interruptible_timeout<T: ?Sized, B: Backend>(
>>          &self,
>>          guard: &mut Guard<'_, T, B>,
>> -        jiffies: Jiffies,
>> +        delta: Delta<Jiffy>,
>>      ) -> CondVarTimeoutResult {
>> -        let jiffies = jiffies.try_into().unwrap_or(MAX_SCHEDULE_TIMEOUT);
>> -        let res = self.wait_internal(TASK_INTERRUPTIBLE, guard, jiffies);
>> +        let jiffies = delta.as_jiffies();
>> +        let res = self.wait_internal(
>> +            TASK_INTERRUPTIBLE,
>> +            guard,
>> +            jiffies.clamp(0, MAX_SCHEDULE_TIMEOUT),
> 
> This pattern shows up many times..
> 
> Makes me wonder if we want a `Duration` type that is `Delta` but unsigned (value
> range restricted between 0..isize::MAX (or i64::MAX for Nsec).
> 
> Or just have a `as_jiffies_unsigned()` which does the clamp.

I think Delta should stay signed. Once we have Instant for jiffies,
the difference of two instants can be negative, for example a deadline
minus the current jiffies. This is a common pattern in C.

I'll add as_jiffies_unsigned() in v8. It clamps a negative value to 0
and returns unsigned long.
