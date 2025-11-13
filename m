Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D40F2E1726
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 10:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763028534; cv=none; b=GVeMRwrRtI9hc4MgcfG9OTNYoaXOotrNJZRXWKdEaytjSuq/0BI+X6T895PsBoPTOVfouEmWaWcr0kqNAZLKrd7LXP1xNWlr2Vtw3G4YjRVyPv0pvzR+XPa5N06MhLcBgAWxCf7F3hU7b7HhkLrt34lZumtb76vyScGPYKrEWIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763028534; c=relaxed/simple;
	bh=kvt780SIWGzlUvGPwKmsBrmD00+cQaoxOlZ0WaCZarE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c4VL8LbOoAKcYYyy8DM7kj7NMiTJYMWNblZAYT9VLvvXjWHKRBUAI4PRqFq4siaGGjcYB8bSbQAB5bXBDjhIe+Quqxhy6WvRf4k7epr/cEPhmpn8dkWwxfv7JzuirpLQJVDxan4Hhyea3/CBO/7IIan2R9GU2uDbg2d0F4JfIf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2JsmxVOb; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2JsmxVOb"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b47f662a0so817521f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 02:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763028531; x=1763633331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvt780SIWGzlUvGPwKmsBrmD00+cQaoxOlZ0WaCZarE=;
        b=2JsmxVOboMyheYfOkI2F9uUyPcfHspHuk4AOuOjOuyfxEv5Xv+sAe14kkPEh/R/MHq
         w2yLMRUS3C1yOeomTYCzpDfeyV+8CcWzMdKBS2uzvzBOGq3jc61UWi3ntfCyVkd5LnyF
         hwM+H37eUABCH4mWdT3k4DUKWlwJ3Yyn7JNVMp6so5o8yjBuBBMQmJ4qXOOIrmW4lyz/
         ZoXIcxrZL47y1b11E4+bMpuituV4g1qQ8l64tzN+YdEY94QeFXpNxBheA+7cTPoISNUr
         PI/b1Sc5Iv9DkzESKOnPY860sN328bPSoT/21MsVTS+Y3hKT3N+816+rLYpxohNLnGTt
         3IIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763028531; x=1763633331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kvt780SIWGzlUvGPwKmsBrmD00+cQaoxOlZ0WaCZarE=;
        b=MZZt7BmcQ76sIOsn6RmfmrS81jaiNS7WqbrA67sJivmSUnQDd7LsyoEfM/g/Darq0O
         DbcRniPjVCSC3TF98/DciOm1CIH4pKRmuD58aopu36zgTY8s+hB8CEjJRFL6J8K/26yi
         /sMY8dkBCs5sCUUmqQiy0SUCZbVlER0D4dTrZ2+RFibQjoP3tCUCGpL+9nxp59VcDzQ3
         FOtOy37V6QNPRBdtPQkplZCm2JKSsdzxpGbyIs4nw/aNr1g4RNdZDROS3ZtVmM5Lzvu0
         7T2PZrMb2u1ZnQ60i0qQIn9Z3Qc6aGWsHxMnFNsT6XyqODWxNAYBfDr6sfowY66eKkT5
         7ssg==
X-Forwarded-Encrypted: i=1; AJvYcCUWXX4/NJxf6Eh2ocuyXx2dGIA6rfbKwmcviStxyl089riRWVEg+i/HRsVQKOu/ZxNQmBkJzASHR0VC5UulnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZWXF6fxTOv1JOMsAyFCqiPdru8f60/TPWPOr+IbOlqFEgE8IL
	4Q2a8JE479V23GbuEydtinWIQsdlxXVdPT4/V6GQanTUYkbHdUEfodNhTb7o/iSot9Y4gw+VVsX
	l09m5KirCU4uCy1misvA4k8quOAJ+FH3u/aG/GUWF
X-Gm-Gg: ASbGncuY17ngr47sjWLSm8PVH5KpFlS2KhORP/Tpme13mWdA4GfED6NYLyAvD8lp+ma
	TUbX9W8f1JDb7SrhgTq1Mhuqd5Nxj5f93migrmBsbXppGgGxszBf5ADA0JV9bPHf341YSv8aANC
	VpxvnLUef4ySFiWv+a4f/2StUwbEeEyIP6ni72uTDdyI+SdjWjXVGUq++xaF+oanzi52pD/X32S
	zY0Q+nCNskjrzpXaxc36MUnoLZU7b5U5QyfrtvnPxHLj8ZBdMyDQHtGGw9HWr+HhhX/0Lp6OSi5
	vIVHdugMpPB6Qx/hcy/diVHVTjVj/xGeTItF
X-Google-Smtp-Source: AGHT+IFhystVj7WTIc2ei7HJTVARjXWLmCYX2E/mWYFTfcgBnm/4nU5LAALUN76YZBGbykrZiWnLxFCjh5F76aExM6I=
X-Received: by 2002:a5d:584a:0:b0:42b:2a41:f2b with SMTP id
 ffacd0b85a97d-42b527bdb33mr2434896f8f.7.1763028531125; Thu, 13 Nov 2025
 02:08:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251113-create-workqueue-v2-0-8b45277119bc@google.com>
 <20251113-create-workqueue-v2-1-8b45277119bc@google.com> <CANiq72k1VqR7P7tY2V_siBQZrNXf_ck5aBkapo6M_6X=1P+nDA@mail.gmail.com>
In-Reply-To: <CANiq72k1VqR7P7tY2V_siBQZrNXf_ck5aBkapo6M_6X=1P+nDA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 13 Nov 2025 11:08:38 +0100
X-Gm-Features: AWmQ_bkNUOmoUuzC22bTOPSTk97TejvJdNA8Vnk7Dt7jP3D-vmq7dUJSIwMgwfc
Message-ID: <CAH5fLgixPsBwqFdY-ku3AtGQHY+qa9m5oqMUshqdob7nzGQpag@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: workqueue: restrict delayed work to global wqs
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	John Hubbard <jhubbard@nvidia.com>, Philipp Stanner <phasta@kernel.org>, 
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benno Lossin <lossin@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 11:06=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Nov 13, 2025 at 11:01=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > When a workqueue is shut down, delayed work that is pending but not
> > scheduled does not get properly cleaned up, so it's not safe to use
> > `enqueue_delayed` on a workqueue that might be destroyed. To fix this,
> > restricted `enqueue_delayed` to static queues.
>
> Should this have a Fixes and Cc: stable?

I could go either way. Without the next patch, there's no way to use a
non-global workqueue. But probably is useful to backport anyway and
there's certainly no harm.

Alice
