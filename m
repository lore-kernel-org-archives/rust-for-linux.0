Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=labbott.name header.i=@labbott.name header.b="aAtlmMPW"
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88481C4
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Nov 2023 06:50:00 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-67131800219so4504166d6.3
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Nov 2023 06:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=labbott.name; s=google; t=1700146199; x=1700750999; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IVTg7l2zl7LrvpBhhvgu7geTYRn6NHRTJVsEFsbIqNA=;
        b=aAtlmMPW2iCFrctsrm7DbldJN5T6cQ97DjrLGJ79dTnJdATvHCK4Ta6FSVbGZyMKuk
         kRIlJ63CeU7JCeSd0XvpOJNFUsBOqn324s3Pi7KI2zf5t4jCFDWm747qR29JVb18l6Ge
         W2IVMYiy729uXmZTtZhq5Y81B0CXShDw1ErGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700146199; x=1700750999;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IVTg7l2zl7LrvpBhhvgu7geTYRn6NHRTJVsEFsbIqNA=;
        b=BO0odXbmxFb2hGMnbjiNyHyiUjrco0M/sZzqZ/YTGkR7EPp+u+YNrQI2KKDjATjXF3
         /25JefsA3DsPM/CTdiUcYfdhXUBBgbqbXTjiX09HAfc+fhQNERLGFbzCM1NrVO9hU/Rc
         UpMB+D253AljE6kCeo+cDa8uHwAxciFGLeGqnth+aP4dRwfp2opDGM+6MM+u4iVN7kRN
         krDZFI2bE3WPCkE4+uOrNVUOHGfTCDq68ZNU0hJ/oH/F6lBpNVt2z8rm89BnLdWxkX9O
         pdUmnm0+ZfAXwhkFYJMf6kls5NshieYdGAhxGcgIV86nsJD0CBlHTg1NUUU230+zqbyV
         JtLQ==
X-Gm-Message-State: AOJu0YyGb/fmhbrmTT35JUOlN19C4JaMxbTPQa2Ybu9Zhct6OvKa6pN9
	5IoqJFvuY/vLQ8y1Ttx3g9Ua+g==
X-Google-Smtp-Source: AGHT+IGHtsg4xGcCTGA6wsa7rTjd0OL1NThUkiD1QRwRVXPtk5Ib9+NzSOMmM/udUhWf/NCoFbIGGQ==
X-Received: by 2002:ad4:50c1:0:b0:677:b0f7:14c1 with SMTP id e1-20020ad450c1000000b00677b0f714c1mr9012095qvq.15.1700146199716;
        Thu, 16 Nov 2023 06:49:59 -0800 (PST)
Received: from [192.168.1.151] (pool-74-98-224-79.pitbpa.fios.verizon.net. [74.98.224.79])
        by smtp.gmail.com with ESMTPSA id ev14-20020a0562140a8e00b00677a11087d8sm1411355qvb.119.2023.11.16.06.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 06:49:59 -0800 (PST)
Message-ID: <970ee9d7-7e24-2376-a9cf-bfdf80385a0f@labbott.name>
Date: Thu, 16 Nov 2023 09:49:58 -0500
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/3] MODVERSIONS + RUST Redux
Content-Language: en-US
To: Matthew Maurer <mmaurer@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: gary@garyguo.net, masahiroy@kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
References: <20231115185858.2110875-1-mmaurer@google.com>
 <CALNs47vtOJ8WcykEtXn==Fn77sqRt9nzPDek-c+625HPfWSx2A@mail.gmail.com>
 <CAGSQo01pE=V+NCdgp-1r_PAfn_48D4yXb91spHf8cZA0Z7GoLA@mail.gmail.com>
 <CAGSQo03pseM9ypkOZuX4UrHN=6kdBRq6a1sGH-T_T6WrOFgXzg@mail.gmail.com>
From: Laura Abbott <laura@labbott.name>
In-Reply-To: <CAGSQo03pseM9ypkOZuX4UrHN=6kdBRq6a1sGH-T_T6WrOFgXzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/23 16:24, Matthew Maurer wrote:
> Should I be sending all these patches to all the lists? I was trying
> to follow the recommendations of get_maintainers.pl, which thought
> modules were the only relevant folks for the export_modules patches.
> (I also added Gary + Masahiro explicitly due to their involvement with
> the previous approach.)
> 
> If I should be sending all the patches to all the lists, should I also
> be adding all the suggested To/Cc lines for all the patches, or? I
> didn't see any suggestions on how to approach this in
> https://docs.kernel.org/process/submitting-patches.html#select-the-recipients-for-your-patch
> 


 From my experience doing work that touched a large number of areas
across the kernel, I would usually cc everyone on the cover letter
so they have context and then only add the relevant people/lists
to the specific patches. I would generate the patches then
manually go through and adjust the To/Cc lists from get_maintainers
before sending them out with git-send-email. Here, I would
definitely make sure the cover letter got sent to the powerpc
list for example.

That said, a three patch series is pretty short so you could
probably get away with ccing everyone on all the patches unless
you've gotten complaints. There are probably other opinions here
too.

Thanks,
Laura
