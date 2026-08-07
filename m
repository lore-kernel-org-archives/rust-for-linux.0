Received: from flow-b7-smtp.messagingengine.com (flow-b7-smtp.messagingengine.com [202.12.124.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABF8472F91
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 12:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786104639; cv=none; b=YbApqX4LsPbqMQN23DlOyR+QNjeyVYKEz+VoD/5OzbIdKNjec7sk/mrNz4z0vLlG9+QFjhsEXqVDMtnCMNYhXlOXkE8T7qRj+yuhJJwBOtfsoULi2P7gD4BY+Wnj5ZWyTpuOyu3lxOqtAs6i/zsxT4CIKYfQe0yz9l1/HmaknLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786104639; c=relaxed/simple;
	bh=AYgU1BBBU5vpGRmkIlgKNgr6GkHP6Gq4Q3onfIqlCww=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=g8QqLsX0huvuwIBUkPtciffKv68COXNmigwFKr5DaFFYZJxcPHF2zVd+wMFn3t5poEPXvhFkl8hWo+XCdzpw7tMbZ9TuKex/QpXDbnyOcm6RiNzgiy2KVQgiCPFxvhjRQ6y3ELJACVC2MD8v3Qnu/C9OUtZ4dOTH2yMNzygzqjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=cjid4XBY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NQf//TIy; arc=none smtp.client-ip=202.12.124.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="cjid4XBY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NQf//TIy"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailflow.stl.internal (Postfix) with ESMTP id 87BCC1300114;
	Fri,  7 Aug 2026 08:10:16 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Fri, 07 Aug 2026 08:10:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1786104616;
	 x=1786108216; bh=4DyLrqXxg7ZyneCkjVMj7pvs+MICNteU04RJn7tHssM=; b=
	cjid4XBY0MMDIH7OFLdoak8fxzjYIw41H9Xg/eBGpsrbuQh5tipPNgavuIzIkcLF
	Fx81AZChUeS6FA52IfeFcA2xTFUsJY4ZWLQpCOde5q7YYB5mwmYsg4pY1fe14Pj1
	tOc0XI7G23CmeKizTby4mNXjfUtP27xGInupd77/fOtjTnhD9wWmW5UUx0zKLxRZ
	bBsosdj+e3PksPgiqzQLNXBXk6OgQ5ND+rddTGnGJvfBeZsnR75hn5JlGT1UJraL
	ouW3TbU+4UHn9nAAmjrhM3/pfpaMB2buhFAVkyNW7KbufsOpi3h0i/i+2fLY3+Y4
	ao+QMPWbz053TCwcM6uYrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786104616; x=
	1786108216; bh=4DyLrqXxg7ZyneCkjVMj7pvs+MICNteU04RJn7tHssM=; b=N
	Qf//TIy2F7ccY2DQ5R76V2PBQPU6dNzn8IlkIOsaugD13C/eaku8SfJqoJA3GZTI
	QhtCXzetk2yzvtcW6izGP5P5kaNVu+rZKdbAwnQDtRgGa5+PTluKXwbrb9ZKEkF9
	3Hq1cMqVQqT43Y4IQSBGVvOVC1e/4nN+UJCE03bYvtanTIJC97FsIVuSSorwi1O8
	7OOFvaoVZ/cCrOTs5jDYjtEYL/ckhdC/ldq7Vz6MUce/N2J/UD7ZijHqeJ+IMrL0
	nS+YHyGIR+s7BmH2eZY+RlmK3/eG5plCpMed+w5PCxNHFLgiIVoFSMEHXFcgnIc6
	rLYOuGf1qX+QxmiSDw6cg==
X-ME-Sender: <xms:J8t1avTsQ08Ny-jwYQl5k19FoBy4iWnUiPiwZfLLbflPFLVZiPWUyA>
    <xme:J8t1agqbofCg8DuphwRq9_319-3_5u4HTAPcqin-xbaGhlDQ2XEsIzKgj8hpLvgde
    _qsntxOVh-9LgilXuOS5KwKQbtrycjMDezaGsG4gca5kRX02RulcRs>
X-ME-Received: <xmr:J8t1aiIGKpavlKZe_blq98jHpQt0ZhAtUjcCk404lRGSqi5QwMOdEWVioygyfaU8oogS03j4rWq1cOh9U0Sg4c44>
X-ME-Proxy-Cause: dmFkZTF+V+BCrFqarQvKUz2eWTJlEbeLHJOem74lm6cFmzW0HnNhtp4cHNMj5vD3rcpTDG
    x0v5i0gkx0dDCiSoI4H30l9rBO8hY70zeRnqGvve+uJIxv9IcG721rLMAueL7a/mrKbIgb
    Fd+5GxjAbViRxDQPpIM+eWkmBOJ5txU2IQtSk0gayPJ7ErQDfotADIdpcCLufy6nRwGNGq
    JM691QRWq6zOLh3vVMDqUXSJMpFvRXmTo2C0BLHKwT3YofDcwmzZQEMWPA0XvYZMYx8hhI
    ySQJmlf7OUz7XLQzViDhbrEaP1YTIqobEFqRt9AbGJPRiq/PRMfb8fY905dpS8i+veFdGM
    FAgPN0lWw9rJjatT6+PV44Y2iqBk5LdzHk3oT+yvNVV0MwNn3heN0NAIL32o9EKSvMpzJ7
    BunY0nJ7+zRgwCfvnc6UTI9TH2WIvDU1yVMz8Ec3zgd9JmOQYiTvNcw0e4CxsJ0nJ3tC9W
    Yu9FGIUG+tX0q/kcoOvjxuZhnOJM3GzmX6QnCpmFIZT2S9hv9yG8Z+88b0dUU7nbVI3Wd3
    5jns9sB952e0/I6CStNweifKX/i0W1GH1W3zy2z2iFAH8sSwsLK79CzAzxumGI1GJxH/8o
    Kn9K7EJN0lXROLwBcnDKEUjmYgsQ+PT6tkXlxVzvQeO1sXEi7xSkwsxPJrRQ
X-ME-Proxy: <xmx:J8t1arPfb7w2GD49eN21Kuum49qKv1bubyYGRCB5G6DvoZDU7S4GGQ>
    <xmx:J8t1alrmKGitwxFxwksondfSDl8FlE-TjElcsWdyeKcHTA5eFPwBnA>
    <xmx:J8t1alE2MdIRjKT9Ibe3pyu2Tik33Y4RMO7YOIyGkuM_bfecmRboAA>
    <xmx:J8t1aiKivSSIPqlRWTEQSGVud9QRIUdV9o329Gunp-AduDK_2lrbGQ>
    <xmx:KMt1ajfSnmEFeS3Mcm5cQkugw9HPjaBluLvv5u2m6dUsUJOnd3HI8pRz>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 08:10:10 -0400 (EDT)
Date: Fri, 07 Aug 2026 21:10:08 +0900 (JST)
Message-Id: <20260807.211008.1388653306665929214.tomo@flapping.org>
To: a.hindborg@kernel.org
Cc: tomo@flapping.org, aliceryhl@google.com, arve@android.com,
 boqun@kernel.org, brauner@kernel.org, cmllamas@google.com,
 gary@garyguo.net, gregkh@linuxfoundation.org, ojeda@kernel.org,
 tkjos@android.com, acourbot@nvidia.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, dakr@kernel.org, daniel.almeida@collabora.com,
 frederic@kernel.org, jstultz@google.com, lossin@kernel.org,
 lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v5 1/7] rust: time: make Delta generic over its time
 unit
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <878q6j4m8a.fsf@t14s.mail-host-address-is-not-set>
References: <20260806073241.1024319-1-tomo@flapping.org>
	<20260806073241.1024319-2-tomo@flapping.org>
	<878q6j4m8a.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 06 Aug 2026 11:44:21 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

>> +/// A time unit of nanoseconds.
>> +///
>> +/// A [`Delta<Nsec>`] stores its value as `i64` nanoseconds and can represent
>> +/// any `i64` value, including negative, zero, and positive numbers.
>> +#[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord, Debug)]
>> +pub struct Nsec;
> 
> Should we make these enum with zero variants to indicate they should not
> be constructed?

Good idea, I will change it in v6.

>> +
>> +impl TimeUnit for Nsec {
>> +    type Repr = i64;
>> +}
>> +
>>  /// A span of time.
>>  ///
>> -/// This struct represents a span of time, with its value stored as nanoseconds.
>> -/// The value can represent any valid i64 value, including negative, zero, and
>> -/// positive numbers.
>> +/// The span is stored in the unit given by the type parameter `U` (see
>> +/// [`TimeUnit`]); its value has type `U::Repr`. `U` defaults to [`Nsec`], so a
>> +/// plain [`Delta`] is a span in nanoseconds. The value can be negative, zero, or
>> +/// positive.
>>  #[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord, Debug)]
>> -pub struct Delta {
>> -    nanos: i64,
>> +pub struct Delta<U: TimeUnit = Nsec> {
>> +    value: U::Repr,
>>  }
>>  
>>  impl ops::Add for Delta {
> 
> When you add `Jiffy` later, this impl block will only cover
> `Delta<Nsec>`. Is that intentional, or did you intend to support
> all these operations operations for `Delta<Jiffy>` as well?

Intentional. Delta<Jiffy> exists to carry a jiffies-valued timeout
across the C boundary; it is not meant as a general arithmetic type. I
can add them if a user needs them.
