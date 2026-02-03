Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4F63B8D78
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Feb 2026 15:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770133184; cv=none; b=geRjjyBdOOdOAPceD8XTfCxX/5OV+IMr/njDm8Co2ghakFImOGZ2fiBX2f1z9Ho2ubjyMO4bU60Ca0Ms0SfPIaPn9j+aCoo6QLW+j9JPed7KQmtpigyHGk8AlXaUT0NT29qsHBgIus+K9sMuQaJBS1Jmn7pNh/t1A8BYFbcO7c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770133184; c=relaxed/simple;
	bh=NoV3epT3XMLJJxjJcfyJFQFSDqsH9iHzfEaWXUXg7aM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JHINXLPIy0RTayk5RPDtg4JnAfzrgor5NtaWyewp+780rQqK2loIWPA0dCDm96/4nl4KbKWpPS76h1S+xss1Mz+PIEfLKJNZahMgPB7VYkBsJUEFnkQUjHOYsSTJ+dW4PjBJNCsc518eYhC++ilkAzdVybp6qhCPdqBjqz8AwCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pdLFyXNr; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pdLFyXNr"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47ee3dd7fc8so58702605e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Feb 2026 07:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770133182; x=1770737982; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jwuwoTFk+PtEY4O1IQ4NpWykbWJHwffpC+PC91GHYEg=;
        b=pdLFyXNrXqLp2QmJ8torCkGwW+df1oSwajTc9gdGwTDoW1UpUdo6s/cUUI5aNUe6dL
         Tl8VrxuOhV+yWqiVoLm6m3iLmD6gxuSgs+PoXiluiSwKMPpAUJZ9H/XY1AOHCKZGRSlJ
         c5Hdpf14DBHhymkpwUWK8FL6neTZ+e73z8M2u3SdhCd1BHTWR1aoU4JncnAAb415dfOE
         vNRE2iDU2ia6FVdOKZ3R6LfGB3VMdqINi0gEoYvjj8p9JmQQYZBginiHOffOcXeP/O0v
         T/WDRzyqC/ylTkWt4DbJbEHbwbx5nwFsxN+5Z748wEdIab9vbTTLRm6QQDQVzHzUsvfN
         JEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770133182; x=1770737982;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jwuwoTFk+PtEY4O1IQ4NpWykbWJHwffpC+PC91GHYEg=;
        b=CUAcjTmUxIgvs8GJncIkpoj61iM/9wQu3HnGOXuzkq0DPeu4Xbv4JRUshe6o23qkPj
         z6ktuPgzx6x2n4l6iioA09g9u8dpgbbmlOY4mY7C1ruGNbvgiPia/CMd3C6V7OSCo7c0
         UUJeohQyp5vBh9Cw5RUxEF9rRrR3IrblqLimQVpXPqzaSj8nfmkWW1H8G679GpX3c9fC
         3PMX8OhTzhPjH+fJGJ9TUG8MJ9DE/vvPQFvwWs00lblGPloxXi1LLf8LTOVtwdI9N3AX
         WuQWp0kyG5h2is71knABEWaqkfBSy86sPk2wizj1NbHtiDj4V7w1hbWJfAVhg7XDLw1s
         ycKg==
X-Forwarded-Encrypted: i=1; AJvYcCUJKcdkyJe/LicgHxnQnS+VkGGGa+GVykPDH570/VeTFMTrwDdAyf6sPm7g7rEwXJR52D7us+Lvqf95yxP5rA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAdDz4adJiLybfmZdRbq/zzp7BgaGujXG2EeDJIpUNbQRz015O
	nA7hj+PZFYobmfc658bvK4AL9alxjE3JKvLGQXVrwf/ui6ZrKo6livGsTP361hqK9wY4e+WMBtR
	+Kg1v+RuzzBpzZoF9Ug==
X-Received: from wmri26-n2.prod.google.com ([2002:a05:600c:8a1a:20b0:480:4a03:7b7e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46d2:b0:483:885:f0b0 with SMTP id 5b1f17b1804b1-4830e99d428mr368175e9.35.1770133182095;
 Tue, 03 Feb 2026 07:39:42 -0800 (PST)
Date: Tue, 3 Feb 2026 15:39:41 +0000
In-Reply-To: <20260203152818.317806-3-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260203152818.317806-1-marco.crivellari@suse.com> <20260203152818.317806-3-marco.crivellari@suse.com>
Message-ID: <aYIWvU0vEtEUPTrD@google.com>
Subject: Re: [PATCH v4 2/2] rust: add system_percpu() and per-cpu enqueue functions
From: Alice Ryhl <aliceryhl@google.com>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Tue, Feb 03, 2026 at 04:28:17PM +0100, Marco Crivellari wrote:
> The C code defines 2 new workqueues: system_percpu_wq and system_dfl_wq,
> respectively the futures replacement for system_wq and system_unbound_wq.
> 
> This change introduce system_percpu(), that use the new system_percpu_wq.
> 
> In order to enqueue on a specific CPU, two new functions have been added
> to the Queue implementation:
> 
>     enqueue_cpu()         - that receive a u32 CPU id as 2nd argument
>     enqueue_delayed_cpu() - that receive a u32 CPU id as 3rd argument
> 
> system_wq (and so workqueue::system()) will be removed in a future
> release cycle and should not be used.
> 
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

